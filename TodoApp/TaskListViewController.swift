//
//  TaskListViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/07.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit
import RealmSwift

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var todoTasks: List<TodoTask>?
    var todoCategory: TodoCategory!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "「\(todoCategory.name)」カテゴリ"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TaskListCell", bundle: nil), forCellReuseIdentifier: "TaskListCell")
        
        todoTasks = todoCategory.tasks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        // タスク一覧ページに戻ってきた時にハイライト解除
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoTasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath) as! TaskListCell
        let todoTask = todoTasks?[indexPath.row]
        if let task = todoTask {
            cell.nameLabel.text = task.name
            if let limitDate = task.limitDate {
                cell.limitLabel.text = "🕑\(DateUtils.stringFromDate(date: limitDate))"
                cell.limitLabel.backgroundColor = limitDateColor(limitDate: limitDate)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = todoTasks![indexPath.row]
            let alert = UIAlertController.doubleBtnAlert(title: "", message: "削除してよろしいですか？", otherBtnTitle: "削除しない", completion: {
                NotificationManager.deleteRemainderPush(todoTask: task)
                RealmManager.deleteTask(todoTask: task)
                tableView.deleteRows(at: [indexPath], with: .fade)
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tappedTask",sender: todoTasks?[indexPath.row])
    }
    
    
    // MARK: -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if (identifier == "tappedTask") {
            let nextVC = segue.destination as! UpdateTaskViewController
            nextVC.todoCategory = todoCategory
            nextVC.todoTask = sender as? TodoTask
        } else if (identifier == "tappedAddBtn") {
            guard let nav = segue.destination as? UINavigationController else {
                return
            }
            guard let newTaskVC = nav.topViewController as? UpdateTaskViewController else {
                return
            }
            newTaskVC.todoCategory = todoCategory
        }
    }

    private func limitDateColor(limitDate: Date) -> UIColor {
        let calender = Calendar(identifier: Calendar.Identifier.gregorian)
        var nowComp = calender.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
        nowComp.hour = 0
        nowComp.minute = 0
        
        let diffComp = calender.dateComponents([.day], from: calender.date(from: nowComp)!, to: limitDate)
        if diffComp.day! <= 0 {
            // 期限当日、もしくは過ぎていたら赤
            return UIColor(red: 255/255.0, green: 182/255.0, blue: 193/255.0, alpha: 1.0)
        } else if diffComp.day! == 1 {
            // 期限前日なら黄色
            return UIColor(red: 255/255.0, green: 241/255.0, blue: 15/255.0, alpha: 1.0)
        }
        
        return UIColor.clear
    }
}

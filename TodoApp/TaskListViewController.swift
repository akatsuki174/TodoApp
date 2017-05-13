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
    var todoTasks:Results<TodoTask>?
    var todoCategory: TodoCategory!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = todoCategory.name
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TaskListCell", bundle: nil), forCellReuseIdentifier: "TaskListCell")
        
        todoTasks = RealmManager.getAllTasks()
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
            let dateStr = task.limitDate == nil ? "" : DateUtils.stringFromDate(date: task.limitDate!)
            cell.limitLabel.text = "🕑\(dateStr)"
        }
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}

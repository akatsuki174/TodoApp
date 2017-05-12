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
    var categoryName: String!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = categoryName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TaskListCell", bundle: nil), forCellReuseIdentifier: "TaskListCell")
        
        todoTasks = RealmManager.getAllTasks()
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
            cell.limitLabel.text = "🕑\(String(describing: task.limitDate))" // TODO: 表記修正
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

//
//  CategoryListViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/05.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var todoCategories:Results<TodoCategory>?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellReuseIdentifier: "CategoryListCell")
        
        todoCategories = RealmManager.getAllCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        // カテゴリ一覧ページに戻ってきた時にハイライト解除
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoCategories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as! CategoryListCell
        let todoCategory = todoCategories?[indexPath.row]
        if let category = todoCategory {
            cell.nameLabel.text = category.name
            cell.numLabel.text = String(describing: category.taskNum)
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController.doubleBtnAlert(title: "", message: "「\(String(describing: todoCategories![indexPath.row].name))」カテゴリの全てのタスクが削除されますがよろしいですか？", otherBtnTitle: "削除しない", completion: {
                
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tappedCategory",sender: todoCategories?[indexPath.row])
    }
    
    // MARK: - 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "tappedCategory") {
            let nextVC = segue.destination as! TaskListViewController
            nextVC.categoryName = (sender as? TodoCategory)?.name ?? ""
        }
    }

}


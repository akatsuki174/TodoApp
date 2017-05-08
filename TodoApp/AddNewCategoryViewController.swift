//
//  AddNewCategoryViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/06.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit
import RealmSwift

class AddNewCategoryViewController : UIViewController {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryNameTextField: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBAction
    
    @IBAction func tappedCloseBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedAddBtn(_ sender: Any) {
        
        if !isValidCategory() {
            return
        }
        let categoryName = categoryNameTextField.text!

        let todoCategory = TodoCategory()
        todoCategory.name = categoryName
        
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(todoCategory)
            }
        } catch {
            // TODO: エラー処理
        }
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - 
    
    private func isValidCategory() -> Bool {
        guard let categoryName = categoryNameTextField.text, !categoryName.isEmpty else {
            let alert = UIAlertController.singleBtnAlert(title: "", message: "カテゴリ名を入力して下さい", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        let category = try! Realm().objects(TodoCategory.self).filter("name == %@", categoryName)
        if category.count > 0 {
            let alert = UIAlertController.singleBtnAlert(title: "", message: "既に同じ名前のカテゴリがあります", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}

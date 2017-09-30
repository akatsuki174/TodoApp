//
//  AddNewCategoryViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/06.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class AddNewCategoryViewController: UIViewController {

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

        if !validCategory() {
            return
        }
        let todoCategory = TodoCategory()
        todoCategory.name = categoryNameTextField.text!

        RealmManager.updateCategoryData(todoCategory: todoCategory)

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: -

    private func validCategory() -> Bool {
        guard let categoryName = categoryNameTextField.text, !categoryName.isEmpty else {
            let alert = UIAlertController.singleBtnAlert(title: "", message: "カテゴリ名を入力して下さい", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        let categories = RealmManager.findCategory(categoryName: categoryName)
        if categories.count > 0 {
            let alert = UIAlertController.singleBtnAlert(title: "", message: "既に同じ名前のカテゴリがあります", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }

}

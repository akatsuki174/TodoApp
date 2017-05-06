//
//  AddNewCategoryViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/06.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

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
        guard let categoryName = categoryNameTextField.text, !categoryName.isEmpty else {
            let alert = UIAlertController.singleBtnAler(title: "", message: "カテゴリ名を入力して下さい", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return
        }
        // TODO: カテゴリ追加処理
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

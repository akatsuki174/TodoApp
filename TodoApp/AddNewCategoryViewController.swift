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
        // TODO: カテゴリ追加処理
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

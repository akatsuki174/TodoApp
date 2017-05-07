//
//  AddNewTaskViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/07.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class AddNewTaskViewController : UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var limitDateTextField: UITextField!
    var toolBar: UIToolbar!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.layer.borderColor = UIColor(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 1.0).cgColor
        setupPickerView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBAction
    
    @IBAction func tappedCloseBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedAddBtn(_ sender: Any) {
        // TODO: タスク追加処理
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UIPickerView
    
    func tappedOK(){
        limitDateTextField.resignFirstResponder()
    }
    
    private func setupPickerView() {
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(AddNewTaskViewController.tappedOK))
        toolBar.items = [toolBarBtn]
        
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action: #selector(AddNewTaskViewController.datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        limitDateTextField.inputView = datePickerView
        limitDateTextField.inputAccessoryView = toolBar
    }
    
    func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy/MM/dd";
        limitDateTextField.text = dateFormatter.string(from: sender.date)
    }
}

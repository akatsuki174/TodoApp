//
//  AddNewTaskViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/07.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class AddNewTaskViewController : UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!    
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
        if !validCategory() {
            return
        }
        // TODO: タスク追加処理
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: -
    
    private func validCategory() -> Bool {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty else {
            let alert = UIAlertController.singleBtnAlert(title: "", message: "タスク名を入力して下さい", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    // MARK: - UIPickerView
    
    @objc private func tappedOK(){
        limitDateTextField.resignFirstResponder()
    }
    
    @objc private func tappedNotSet(){
        limitDateTextField.text = ""
        limitDateTextField.resignFirstResponder()
    }
    
    private func setupPickerView() {
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let okBtn = UIBarButtonItem(title: "設定する", style: .plain, target: self, action: #selector(AddNewTaskViewController.tappedOK))
        let notSetBtn = UIBarButtonItem(title: "設定しない", style: .plain, target: self, action: #selector(AddNewTaskViewController.tappedNotSet))
        toolBar.items = [okBtn,notSetBtn]
        
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action: #selector(AddNewTaskViewController.datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        limitDateTextField.inputView = datePickerView
        limitDateTextField.inputAccessoryView = toolBar
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy/MM/dd";
        limitDateTextField.text = dateFormatter.string(from: sender.date)
    }
}

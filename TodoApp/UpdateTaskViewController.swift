//
//  UpdateTaskViewController.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/07.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class UpdateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var limitDateTextField: UITextField!
    private var toolBar: UIToolbar!
    var todoCategory: TodoCategory!
    var todoTask: TodoTask?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.layer.borderColor = UIColor(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 1.0).cgColor
        setupPickerView()
        setupNaviBarBtn()
        setupTaskInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Tap Action
    
    @objc private func clickedLeftBtn(_ sender: Any) {
        goPreviousVC()
    }
    
    @objc private func clickedRightBtn(_ sender: Any) {
        if !validCategory() {
            return
        }
        updateTodoTask()
        goPreviousVC()
    }
    
    private func goPreviousVC () {
        if todoTask == nil {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
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
    
    private func updateTodoTask() {
        let todoTask = TodoTask()
        if let id = self.todoTask?.id {
            todoTask.id = id
        }
        todoTask.name = taskNameTextField.text!
        todoTask.category = todoCategory
        todoTask.memo = memoTextView.text
        todoTask.limitDate = DateUtils.dateFromString(string: limitDateTextField.text ?? "")
        
        if self.todoTask == nil {
            RealmManager.insertTaskData(todoCategory: todoCategory, todoTask: todoTask)
            NotificationManager.registerRemainderPush(todoTask: todoTask)
        } else {
            RealmManager.updateTaskData(todoCategory: todoCategory, todoTask: todoTask)
            NotificationManager.deleteRemainderPush(todoTask: todoTask)
            NotificationManager.registerRemainderPush(todoTask: todoTask)
        }
    }
    
    private func setupNaviBarBtn() {
        if todoTask == nil {
            self.title = "新規タスク"
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(UpdateTaskViewController.clickedLeftBtn(_:)))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "追加", style: .plain, target: self, action: #selector(UpdateTaskViewController.clickedRightBtn(_:)))
        } else {
            self.title = "タスク詳細"
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "更新", style: .plain, target: self, action: #selector(UpdateTaskViewController.clickedRightBtn(_:)))
        }
    }
    
    private func setupTaskInfo() {
        if todoTask != nil {
            taskNameTextField.text = todoTask?.name
            memoTextView.text = todoTask?.memo
            limitDateTextField.text = todoTask?.limitDate != nil ? DateUtils.stringFromDate(date: (todoTask?.limitDate)!) : ""
        }
    }
    
    // MARK: - UIPickerView
    
    @objc private func tappedOK() {
        limitDateTextField.resignFirstResponder()
    }
    
    @objc private func tappedNotSet() {
        limitDateTextField.text = ""
        limitDateTextField.resignFirstResponder()
    }
    
    private func setupPickerView() {
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let okBtn = UIBarButtonItem(title: "設定する", style: .plain, target: self, action: #selector(UpdateTaskViewController.tappedOK))
        let notSetBtn = UIBarButtonItem(title: "設定しない", style: .plain, target: self, action: #selector(UpdateTaskViewController.tappedNotSet))
        toolBar.items = [okBtn, notSetBtn]
        
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action: #selector(UpdateTaskViewController.datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        limitDateTextField.inputView = datePickerView
        limitDateTextField.inputAccessoryView = toolBar
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        limitDateTextField.text = DateUtils.stringFromDate(date: sender.date)
    }
}

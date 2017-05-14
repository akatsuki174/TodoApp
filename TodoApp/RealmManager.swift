//
//  RealmManager.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/10.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager {
    static let realm = try! Realm()
    
    class func getAllCategories() -> Results<TodoCategory>? {
        return realm.objects(TodoCategory.self)
    }
    
    class func updateCategoryData(todoCategory: TodoCategory) {
        do {
            try realm.write {
                realm.add(todoCategory, update: true)
            }
        } catch {
            // TODO: エラー処理
        }
    }
    
    class func updateTaskData(todoCategory: TodoCategory, todoTask: TodoTask) {
        do {
            try realm.write {
                realm.add(todoTask, update: true)
                realm.add(todoCategory, update: true)
            }
        } catch {
            // TODO: エラー処理
        }
    }
    
    class func insertTaskData(todoCategory: TodoCategory, todoTask: TodoTask) {
        do {
            try realm.write {
                todoCategory.tasks.append(todoTask)
                realm.add(todoCategory, update: true)
            }
        } catch {
            // TODO: エラー処理
        }
    }
    
    class func deleteCategory(todoCategory: TodoCategory) {
        do {
            try realm.write {
                realm.delete(todoCategory.tasks)
                realm.delete(todoCategory)
            }
        } catch {
            // TODO: エラー処理
        }
    }
    
    class func deleteTask(todoTask: TodoTask) {
        do {
            try realm.write {
                realm.delete(todoTask)
            }
        } catch {
            // TODO: エラー処理
        }
    }
}

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
    
    class func getAllTasks() -> Results<TodoTask>? {
        return realm.objects(TodoTask.self)
    }
    
    class func insertCategoryData(todoCategory: TodoCategory) {
        do {
            try realm.write {
                realm.add(todoCategory)
            }
        } catch {
            // TODO: エラー処理
        }
    }
    
    class func insertTaskData(todoTask: TodoTask) {
        do {
            try realm.write {
                realm.add(todoTask)
            }
        } catch {
            // TODO: エラー処理
        }
    }
}

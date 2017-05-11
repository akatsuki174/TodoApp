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
    
    class func getAllCategory() -> Results<TodoCategory>? {
        return realm.objects(TodoCategory.self)
    }
}

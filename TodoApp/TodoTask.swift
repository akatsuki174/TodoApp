//
//  TodoTask.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/07.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import Foundation
import RealmSwift

class TodoTask: Object {

    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var memo: String? = ""
    dynamic var category: TodoCategory? = nil
    dynamic var limitDate: NSDate = NSDate()
    dynamic var createdDate: NSDate = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

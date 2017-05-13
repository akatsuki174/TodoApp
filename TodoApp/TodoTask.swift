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

    dynamic var id: String = UUID().uuidString
    dynamic var name: String = ""
    dynamic var memo: String?
    dynamic var category: TodoCategory?
    dynamic var limitDate: Date?
    dynamic var createdDate: Date = Date()
    
    convenience init(name: String, memo: String?, category: TodoCategory?, limitDate: Date?) {
        self.init()
        self.name = name
        self.memo = memo
        self.category = category
        self.limitDate = limitDate
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

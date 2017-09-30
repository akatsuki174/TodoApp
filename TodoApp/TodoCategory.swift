//
//  TodoCategory.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/06.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import Foundation
import RealmSwift

class TodoCategory: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var createdDate: Date = Date()
    let tasks = List<TodoTask>()
    
    // カテゴリ名の重複を許さない仕様なのでnameを主キーに設定
    override static func primaryKey() -> String? {
        return "name"
    }
}

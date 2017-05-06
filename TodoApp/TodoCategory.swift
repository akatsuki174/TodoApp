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
    
    dynamic var name: String = ""
    dynamic var num: Int = 0
    
    // カテゴリ名の重複を許さない仕様なのでnameを主キーに設定
    override static func primaryKey() -> String? {
        return "name"
    }
}

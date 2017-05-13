//
//  DateUtils.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/13.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class DateUtils {
    static let locale = Locale(identifier: "ja_JP")
    static let dateFormatter = "yyyy/MM/dd"
    
    class func dateFromString(string: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = dateFormatter
        return formatter.date(from: string)!
    }
    
    class func stringFromDate(date: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = dateFormatter
        return formatter.string(from: date)
    }
}

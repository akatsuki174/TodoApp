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
    
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }
    
    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

//
//  NotificationManager.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/14.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class NotificationManager {
    class func registerRemainderPush(todoTask: TodoTask) {
        guard let limitDate = todoTask.limitDate else {
            return
        }
        let theDayBeforePushDate = NotificationManager.calculateFireDate(date: limitDate, type: .theDayBefore)
        let theDayPushDate = NotificationManager.calculateFireDate(date: limitDate, type: .theDay)
        let application = UIApplication.shared
        let now = Date()
        
        if theDayBeforePushDate.compare(now) == .orderedDescending {
            // 前日プッシュ
            let theDayBeforeNotif = UILocalNotification()
            theDayBeforeNotif.alertBody = "明日締め切りです：\(todoTask.name)"
            theDayBeforeNotif.fireDate = theDayBeforePushDate
            theDayBeforeNotif.applicationIconBadgeNumber += 1
            theDayBeforeNotif.userInfo = ["id": todoTask.id, "type": PushType.theDayBefore.rawValue]
            application.scheduleLocalNotification(theDayBeforeNotif)
        }

        if theDayPushDate.compare(now) == .orderedDescending {
            // 当日プッシュ
            let theDayNotif = UILocalNotification()
            theDayNotif.alertBody = "今日締め切りです：\(todoTask.name)"
            theDayNotif.fireDate = theDayPushDate
            theDayNotif.applicationIconBadgeNumber += 1
            theDayNotif.userInfo = ["id": todoTask.id, "type": PushType.theDay.rawValue]
            application.scheduleLocalNotification(theDayNotif)
        }
    }
    
    class func deleteRemainderPush(todoTask: TodoTask) {
        for notif in UIApplication.shared.scheduledLocalNotifications! {
            if notif.userInfo?["id"] as! String == todoTask.id {
                UIApplication.shared.cancelLocalNotification(notif)
            }
        }
    }
    
    class func calculateFireDate(date: Date, type: PushType) -> Date {
        let calender = Calendar(identifier: Calendar.Identifier.gregorian)
        var comps = calender.dateComponents([.year, .month, .day, .hour], from: date)
        if type == .theDayBefore {
            comps.day = comps.day! - 1
            comps.hour = 20
            return calender.date(from: comps)!
        } else {
            comps.hour = 8
            return calender.date(from: comps)!
        }
    }
    
 
}

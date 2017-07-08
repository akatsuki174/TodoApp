//
//  AppDelegate.swift
//  TodoApp
//
//  Created by akatsuki174 on 2017/05/05.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let notification = launchOptions?[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification,let _ = notification.userInfo {
            application.applicationIconBadgeNumber = 0
            application.cancelLocalNotification(notification)
        }
        
        let settings = UIUserNotificationSettings(types: [.badge, .alert], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        window?.backgroundColor = UIColor.white
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        if application.applicationState != .active {
            application.applicationIconBadgeNumber = 0
            application.cancelLocalNotification(notification)
        } else {
            if application.applicationIconBadgeNumber != 0 {
                application.applicationIconBadgeNumber = 0
                application.cancelLocalNotification(notification)
            }
        }
    }
}


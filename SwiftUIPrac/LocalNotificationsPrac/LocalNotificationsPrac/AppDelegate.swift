//
//  AppDelegate.swift
//  LocalNotificationsPrac
//
//  Created by SUCHAN CHANG on 2023/10/24.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        // Your other setup code here...
        return true
    }
    
    // 앱이 Foreground 있을 때 Local Notifications 수신
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("willPresent")
        completionHandler([.banner, .sound])
    }
    
    // 앱이 Background 있을 때 Local Notificatoins 수신
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        print("didReceive")
//        completionHandler()
//    }
}

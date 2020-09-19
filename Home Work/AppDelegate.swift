//
//  AppDelegate.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 6/29/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notificationsCenter = UNUserNotificationCenter.current()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationsCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            
            guard success else { return }
            
            self.notificationsCenter.getNotificationSettings { (settings) in
                print(settings)
                
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
        
        notificationsCenter.delegate = self
//        sendNotifications()
        
        return true
    }
    
    
    
    func sendNotifications() {
        
        let content = UNMutableNotificationContent() 
        let requestIdenti = "notifications"
        let userActions = "User Actions"
        
        content.title = "Notification"
        content.body = "Hello dear user"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = userActions
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: requestIdenti, content: content, trigger: trigger)
        
        notificationsCenter.add(request) { (error) in
            print(error)
            
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: userActions, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        notificationsCenter.setNotificationCategories([category])
    }
    
}



extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
        print(#function)
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print(#function)
    }
}







//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


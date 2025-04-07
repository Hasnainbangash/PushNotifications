//
//  AppDelegate.swift
//  PushNotifications
//
//  Created by Elexoft on 07/04/2025.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    // Called when the app finishes launching. We use it to set up Firebase.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    // Called when the device successfully registers for push notifications and gets a device token from Apple.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    // Called when a notification is received while the app is open (in foreground).
    // We can choose to show a banner, play sound, etc.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
    // Called when the user taps on a notification or interacts with it.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        
    }
    
    // This runs when Firebase gives us a token to send notifications to this phone.
    // This token is used to send push notifications to this specific app instance.
    @objc func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
    }
    
}

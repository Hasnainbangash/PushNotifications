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
        if #available(iOS 10.0, *) {
            // Requesting the permission from the user
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                print("Permission granted: \(granted)")
            }
            UNUserNotificationCenter.current().delegate = self
            Messaging.messaging().delegate = self
        }
        application.registerForRemoteNotifications()
        return true
    }
    
    // Called when the device successfully registers for push notifications and gets a device token from Apple.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    // Called when a notification is received while the app is open (in foreground).
    // We can choose to show a banner, play sound, etc.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
    // Called when the user taps on a notification or interacts with it.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        NotificationCenter.default.post(name: Notification.Name("didReceiveRemoteNotification"), object: nil, userInfo: userInfo)
        completionHandler()
    }
    
    // This runs when Firebase gives us a token to send notifications to this phone.
    // This token is used to send push notifications to this specific app instance.
    @objc func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        // We function we want to do that if soon as the registration tokens is received from firebase we want to print it out because we need that token in order to send push notifications
        print("Firebase token: \(String(describing: fcmToken))")
    }
    
}

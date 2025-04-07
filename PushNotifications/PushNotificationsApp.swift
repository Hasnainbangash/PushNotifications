//
//  PushNotificationsApp.swift
//  PushNotifications
//
//  Created by Elexoft on 07/04/2025.
//

import SwiftUI

@main
struct PushNotificationsApp: App {
    // Giving the reference to the App delegate file
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

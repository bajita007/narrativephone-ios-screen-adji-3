//
//  NarrativePhoneApp.swift
//  NarrativePhone
//
//  Created by Muhammad Dzul Arsyil on 09/08/23.
//

import SwiftUI
import FirebaseCore

import UserNotifications
import PushKit
import CallKit

// TODO: update this value on production
let jwtToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBLZXkiOiJ3aURZR1hPa1M0Szhzc1NGRjd1djdBIiwiaWF0IjoxNjkyNjE0NjAzLCJleHAiOjE3MDIzMTQwMDAsInRva2VuRXhwIjoxNzAyMzE0MDAwfQ.ums4R1EQ1Zpouc7HJNpMkGQRaMEXWcM0WtkdjAFKLnY"


class AppDelegate: NSObject, UIApplicationDelegate {
    static let Shared = AppDelegate()
    let zoomService = ZoomService()
    let callkit = CallAppDelegate()
    var window: UIWindow?
    

    func application(_ application: UIApplication,
                     
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        FirebaseApp.configure()
        zoomService.initializeSDK(jwtToken: jwtToken)
        callkit.registerForPushNotifications()
        callkit.setupPushKit()
        return true
    }

}


@main
struct NarrativePhoneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

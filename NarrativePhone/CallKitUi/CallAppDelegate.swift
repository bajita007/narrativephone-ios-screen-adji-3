//
//  CallDelegeate.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import UIKit
import UserNotifications
import PushKit
import CallKit


class CallAppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    var provider: CXProvider?
    

//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//     
//        return true
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func registerForPushNotifications() {
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                (granted, error) in
                print("Permission granted: \(granted)")
                // 1. Check if permission granted
                guard granted else { return }
                // 2. Attempt registration for remote notifications on the main thread
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            // 1. Convert device token to string
        let token = deviceToken.map { String(format: "%.2hhx", $0) }.joined()

        
            // 2. Print device token to use for PNs payloads
            print("Device Token: \(token)")
        }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // 1. Print out error if PNs registration not successful
        print("Failed to register for remote notifications with error: \(error)")
    }


}

extension CallAppDelegate {
    func setupPushKit() {
        print("test: setupPushKit()")
        let voipRegistry: PKPushRegistry = PKPushRegistry(queue: .main)
        voipRegistry.delegate = self
        voipRegistry.desiredPushTypes = [.voIP]
    }
}

extension CallAppDelegate: PKPushRegistryDelegate {

    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        print("test: didUpdate pushCredentials")
        let pkid = pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined()
        
        print("your device token: \(pkid)")
        
    }

    func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
        print("test: didInvalidatePushTokenFor")
    }

    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType,  completion: @escaping () -> Void) {
        print("test: didReceiveIncomingPushWith")
        let uuid = UUID()
        let configuration = CXProviderConfiguration(localizedName: "HogeApp")
        configuration.supportedHandleTypes = [.phoneNumber, .generic]

        self.provider = CXProvider(configuration: configuration)
        
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "narrative")  // 第二引数は null を入れない
        update.localizedCallerName = "ナラティブテスト"  // 指定していないと「不明」と表示される
        update.hasVideo = true  // trueの場合「アプリ名ビデオ」、falseの場合「アプリ名オーディオ」と表示される
        // 2. CallKit着信画面を表示。
        provider!.reportNewIncomingCall(with: uuid, update: update) { _ in
            // 3. CallKit#reportNewIncomingCall の completionHandler 内部で PushKit の completionHandler を呼び出す。
            completion()
        }
        
    }
}

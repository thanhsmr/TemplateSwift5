//
//  AppDelegate.swift
//  Template
//
//  Created by cowell on 1/16/18.
//  Copyright © 2018 Other. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootView: MainTabbarViewController?
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    
    func openSplashView() {
           window = UIWindow(frame: UIScreen.main.bounds)
           let rootView: UINavigationController = UINavigationController.init(rootViewController: SplashScreenViewController.fromNib())
           rootView.navigationController?.setNavigationBarHidden(true, animated: false)
           
           window?.rootViewController = rootView
           window?.makeKeyAndVisible()
       }
       
       public func openMainView() {
           rootView = MainTabbarViewController()
           UIApplication.shared.keyWindow?.rootViewController = rootView
       }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Template")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

// Handle Notification
/*
 
 
 func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
         let facebook = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
         
         let google = GIDSignIn.sharedInstance().handle(url)
         
         return facebook || google
     }
     
     func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
               withError error: Error!) {
         if let error = error {
             print("\(error.localizedDescription)")
         } else {
             // Perform any operations on signed in user here.
 //            let userId = user.userID                  // For client-side use only!
 //            let idToken = user.authentication.idToken // Safe to send to the server
 //            let fullName = user.profile.name
 //            let givenName = user.profile.givenName
 //            let familyName = user.profile.familyName
 //            let email = user.profile.email
             // ...
             let accessToken = user.authentication.accessToken
             NotificationCenter.default.post(name: Constants.NotificationName.didSignInGoogle, object: nil)
         }
     }
     
     func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
               withError error: Error!) {
         // Perform any operations when the user disconnects from app here.
         // ...
     }
     
 
  // [START receive_message]
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
      if let messageID = userInfo[gcmMessageIDKey] {
          print("Message ID 1: \(messageID)")
      }
      print(userInfo)
  }
  
  //foreground
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                   fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      
      if let messageID = userInfo[gcmMessageIDKey] {
          print("Message ID 2: \(messageID)")
      }
      
      print(userInfo)
      
      completionHandler(UIBackgroundFetchResult.newData)
      
  }
  
  // [END receive_message]
  
  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Unable to register for remote notifications: \(error.localizedDescription)")
  }
  
  // [START - Token]
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
  }
  // [END - Token]

 
extension AppDelegate : MessagingDelegate {
    // [START refresh_token]
    private func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        Context.saveCurrentFcmToken(token: fcmToken)
    }
    // [END refresh_token]
    
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        print("Firebase registration token: \(fcmToken)")
        Context.saveCurrentFcmToken(token: fcmToken)
    }
    
    // [START ios_10_data_message]
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Received data message: \(remoteMessage.appData)")
    }
    // [END ios_10_data_message]
}

// [START ios_10_message_handling]

@available(iOS 10.0, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID 3: \(messageID)")
        }
        
        print(userInfo)
        
        completionHandler(UNNotificationPresentationOptions.alert)
    }
    
    func convertToDictionary(text: String) -> NSDictionary? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    //handle notification messages after display notification is tapple by the user
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID 4: \(messageID)")
        }
        
        completionHandler()
    }
}
// [END ios_10_message_handling]
*/

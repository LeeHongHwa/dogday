//
//  AppDelegate.swift
//  DogDay
//
//  Created by david on 2017. 10. 7..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Scheme.sharedInstance.url = launchOptions?[UIApplicationLaunchOptionsKey.url] as? URL
        setupKeyWindow(schemeURL: Scheme.sharedInstance.url)
        return true
    }

    private func setupKeyWindow(schemeURL: URL?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = MainViewController()
        mainViewController.schemeData.url = schemeURL
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        if Scheme.sharedInstance.isShowLaunchScreen && schemeURL == nil {
            LaunchScreenView.show()
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        DogDays.sharedInstance.encoded()
        WidgetDatas.sharedInstance.encoded()
        WidgetDatas.sharedInstance.synchronize()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
//
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard URL.isDogdayScheme(url) else { return false }
        Scheme.sharedInstance.url = url
        NotificationCenter.postOpenURLNotification(url: url)
        return true
    }
}

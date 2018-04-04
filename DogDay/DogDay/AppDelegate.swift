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
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        DogDays.sharedInstance.encoded()
        WidgetDatas.sharedInstance.encoded()
        WidgetDatas.sharedInstance.synchronize()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard URL.isDogdayScheme(url) else { return false }
        Scheme.sharedInstance.url = url
        NotificationCenter.postOpenURLNotification(url: url)
        return true
    }
}

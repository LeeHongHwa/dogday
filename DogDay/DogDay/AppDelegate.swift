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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Scheme.instance.url = launchOptions?[.url] as? URL
        setupKeyWindow(with: Scheme.instance.url)
        return true
    }

    private func setupKeyWindow(with url: URL?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = MainViewController(schemeData: Scheme(url: url))
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        guard Scheme.instance.isShowLaunchScreen && url == nil else { return }
        LaunchScreenView.show()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        DogDays.instance.encoded()
        WidgetDatas.instance.encoded()
        WidgetDatas.instance.synchronize()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard URL.isDogdayScheme(url) else { return false }
        Scheme.instance.url = url
        NotificationCenter.postOpenURLNotification(url: url)
        return true
    }
}

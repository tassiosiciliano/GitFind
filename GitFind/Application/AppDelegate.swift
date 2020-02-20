//
//  AppDelegate.swift
//  GitFind
//
//  Created by Tassio Siciliano on 09/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let main = MainViewController(nibName: "MainViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: main)
        if #available(iOS 13.0, *) {
            navigationController.navigationBar.tintColor = UIColor.label
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}


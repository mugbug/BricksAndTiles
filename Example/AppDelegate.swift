//
//  AppDelegate.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow()

        let viewController = ExampleListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

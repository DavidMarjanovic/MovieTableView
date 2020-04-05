//
//  AppDelegate.swift
//  drugiZadatak
//
//  Created by David Marjanović on 12/03/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialViewController = UINavigationController(rootViewController: ViewController())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = initialViewController
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    


}


//
//  AppDelegate.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = CategoryListViewController(CategoryListViewModel())
        return true
    }


}


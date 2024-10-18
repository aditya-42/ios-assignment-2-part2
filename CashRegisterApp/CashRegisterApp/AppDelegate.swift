//
//  AppDelegate.swift
//  CashRegisterApp
//
//  Created by Aditya Purohit on 07/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var allProducts: [ProductModel] = [
        ProductModel(name: "Pants", quantity: 20, price: 40.00),
        ProductModel(name: "Shoes", quantity: 50, price: 70.00),
        ProductModel(name: "Hats", quantity: 10, price: 10.00),
        ProductModel(name: "T-shirts", quantity: 10, price: 30.00),
        ProductModel(name: "Dresses", quantity: 24, price: 60.00)
    ]
    
    var historyItems:[HistoryModel] = []


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

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


}


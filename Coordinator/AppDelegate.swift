//
//  AppDelegate.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let navigationController = UINavigationController()
        let appCoordinator = AppCoordinator(rootViewController: navigationController)
    
//        let appLink = DeepLink(value: AppLink.login)
//        appCoordinator.start(appLink)
        
        let temp = ApplicationCoordinator(rootViewController: navigationController)
        let appLink = TestDeepLink(value: AppLink.login)
        appLink.add(child: LoginLink.signUp.rawValue)
        
        temp.start(appLink)

        self.window?.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }
}


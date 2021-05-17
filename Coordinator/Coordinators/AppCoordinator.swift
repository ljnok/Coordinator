//
//  AppCoordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let viewController = AppViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.setViewControllers([viewController], animated: false)
    }

    // MARK: - Public
    func loginButtonPressed() {
        let loginCoordinator = LoginCoordinator(rootViewController: rootViewController)
        loginCoordinator.dismiss = self.didChildDismissed(_:)
        loginCoordinator.start()
        
        children.append(loginCoordinator)
    }
    
    func homeButtonPressed() {
        let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
        homeCoordinator.dismiss = self.didChildDismissed(_:)
        homeCoordinator.start()
        
        children.append(homeCoordinator)
    }
}

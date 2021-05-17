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
    
    // MARK: - Private
    private func childFinished(_ coordinator: Coordinator) {
        self.removeChild(coordinator)
    }
    
    // MARK: - Public
    func loginButtonPressed() {
        let loginCoordinator = LoginCoordinator(rootViewController: rootViewController)
        children.append(loginCoordinator)
        
        loginCoordinator.finished = childFinished
        loginCoordinator.start()
    }
    
    func homeButtonPressed() {
        let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
        children.append(homeCoordinator)
        
        homeCoordinator.finished = childFinished
        homeCoordinator.start()
    }
}

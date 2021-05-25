//
//  AppCoordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

enum AppLink: Link {
    case login
    case home
}

class AppCoordinator: BaseCoordinator<AppLink> {

    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
        
        let viewController = AppViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.setViewControllers([viewController], animated: true)
    }
    
    override func prepare(for link: DeepLink<AppLink>) {
        switch link.type {
        case .login:
            let loginCoordinator = LoginCoordinator(rootViewController: rootViewController)
            let subLink = link.children.first(where: { $0.value is LoginLink })
            loginCoordinator.start(subLink as? DeepLink)

        case .home:
            let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
            let subLink = link.children.first(where: { $0.value is HomeLink })
            homeCoordinator.start(subLink as? DeepLink)
        }
    }

    // MARK: - Public
    func loginButtonPressed() {
        start(DeepLink(value: AppLink.login))
    }

    func homeButtonPressed() {
        start(DeepLink(value: AppLink.home))
    }
}

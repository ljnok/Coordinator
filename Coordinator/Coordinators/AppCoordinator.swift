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

class AppCoordinator: Coordinator {

    var children: [Coordinator] = []

    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        
        let viewController = AppViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.setViewControllers([viewController], animated: false)
    }

    func start(_ deepLink: DeepLink? = nil) {
        guard let link = deepLink,
              let value = link.value as? AppLink
        else { return }
        
        switch value {
        case .login:
            let loginCoordinator = LoginCoordinator(rootViewController: rootViewController)
            loginCoordinator.dismiss = didChildDismissed(_:)
            let subLink = link.children.first(where: { $0.value is LoginLink })
            loginCoordinator.start(subLink as? DeepLink)

            children.append(loginCoordinator)
            
        case .home:
            break
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

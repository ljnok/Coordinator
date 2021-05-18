//
//  LoginCoordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

enum LoginLink: Link {
    case signUp
}

class LoginCoordinator: Coordinator {

    var children: [Coordinator] = []

    var rootViewController: UINavigationController
    
    var dismiss: ((Coordinator) -> Void)?

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        
        let viewController = LoginViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: false)
    }

    func start(_ deepLink: DeepLink? = nil) {
        guard let link = deepLink,
              let value = link.value as? LoginLink
        else { return }
        
        switch value {
        case .signUp:
            break
        }
    }

    // MARK: - Public
    func backButtonPressed() {
        dismiss?(self)
    }
}

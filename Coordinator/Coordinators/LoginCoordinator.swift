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

class LoginCoordinator: BaseCoordinator<LoginLink> {

    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
        
        let viewController = LoginViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: true)
    }

    override func prepare(for link: DeepLink<LoginLink>) {
        switch link.type {
        case .signUp:
            let signUpCoordinator = SignUpCoordinator(rootViewController: rootViewController)
            signUpCoordinator.start()
        }
    }
    
    // MARK: - Public
    func signUpButtonPressed() {
        start(DeepLink(value: LoginLink.signUp))
    }
    
    func backButtonPressed() {
        dismiss(self)
    }
}

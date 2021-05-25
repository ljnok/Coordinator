//
//  SignUpCoordinator.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/25.
//

import UIKit

enum SignUpLink: Link {
}

class SignUpCoordinator: BaseCoordinator<SignUpLink> {
    
    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
        
        let viewController = SignUpViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: true)
    }

    override func prepare(for link: DeepLink<SignUpLink>) {
    }
    
    // MARK: - Public
    func backButtonPressed() {
        dismiss(self)
    }
}

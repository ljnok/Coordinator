//
//  HomeCoordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    
    var rootViewController: UINavigationController
    
    var dismiss: ((Coordinator) -> Void)?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let viewController = HomeViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: false)
    }
    
    // MARK: - Public
    func backButtonPressed() {
        dismiss?(self)
    }
}

//
//  HomeCoordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

enum HomeLink: Link {
    case setting
    case newsDetail
}

class HomeCoordinator: Coordinator {

    var children: [Coordinator] = []

    var rootViewController: UINavigationController
    
    var dismiss: ((Coordinator) -> Void)?

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        
        let viewController = HomeViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: false)
    }

    func start(_ deepLink: DeepLink? = nil) {
        guard let link = deepLink,
              let value = link.value as? HomeLink
        else { return }
        
        switch value {
        case .setting:
            break
        case .newsDetail:
            break
        }
    }

    // MARK: - Public
    func backButtonPressed() {
        dismiss?(self)
    }
}

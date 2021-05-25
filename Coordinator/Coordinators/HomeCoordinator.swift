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

class HomeCoordinator: BaseCoordinator<HomeLink> {

    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
        
        let viewController = HomeViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: true)
    }

    override func prepare(for link: DeepLink<HomeLink>) {
        switch link.type {
        case .setting:
            break
        case .newsDetail:
            break
        }
    }
    
    // MARK: - Public
    func backButtonPressed() {
        dismiss(self)
    }
}

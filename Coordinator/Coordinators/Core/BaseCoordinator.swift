//
//  BaseCoordinator.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/25.
//

import UIKit

class BaseCoordinator<LinkType: Link>: Coordinator {
     
    var children: [CoordinatorItem] = []
    
    var rootViewController: UINavigationController
    
    var dismiss: ((CoordinatorItem) -> Void) {
        return didChildDismissed(_:)
    }
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start(_ deepLink: DeepLink<LinkType>? = nil) {
        guard let link = deepLink else { return }
        prepare(for: link)
    }
    
    func prepare(for link: DeepLink<LinkType>) {
        fatalError("Please override the \(#function) method.")
    }
}

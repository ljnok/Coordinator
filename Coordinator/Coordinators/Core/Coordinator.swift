//
//  Coordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

protocol Coordinator: AnyObject {

    var children: [Coordinator] { get set }

    func start(_ deepLink: DeepLink?)
}

extension Coordinator {
    
    func didChildDismissed(_ coordinator: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === coordinator})
        else { return }

        children.remove(at: index)
    }
}

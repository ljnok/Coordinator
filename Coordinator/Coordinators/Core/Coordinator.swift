//
//  Coordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

protocol CoordinatorItem: AnyObject {
    var children: [CoordinatorItem] { get set }
}

protocol Coordinator: Linker, CoordinatorItem {

    func start(_ deepLink: DeepLink<LinkType>?)

    func prepare(for link: DeepLink<LinkType>)
}

extension Coordinator {
    
    func didChildDismissed(_ coordinator: CoordinatorItem) {
        guard let index = children.firstIndex(where: { $0 === coordinator})
        else { return }

        //children.remove(at: index)
    }
}

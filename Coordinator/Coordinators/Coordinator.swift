//
//  Coordinator.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var children: [Coordinator] { get set }
    
    func start()
}

extension Coordinator {
    
    func removeChild(_ coordinaotr: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === coordinaotr})
        else {
            return
        }
        
        children.remove(at: index)
    }
}

//
//  Tree.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/18.
//

import Foundation

class Node<T> {
    var value: T
    weak var parent: Node?
    var children: [Node] = []
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    func remove(child: Node) {
        guard let index = children.firstIndex(where: { $0 === child})
        else { return }
        
        children.remove(at: index)
    }
}

//
//  DeepLink.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/18.
//

import Foundation

protocol Link {
}

protocol Linker {
    associatedtype LinkType: Link
}

class DeepLink<T>: Node<Link> {
    var type: T {
        return self.value as! T
    }
}


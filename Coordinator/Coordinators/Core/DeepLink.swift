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


// Type, Protocol 관련
// https://sujinnaljin.medium.com/swift-generic%EA%B3%BC-subtype-c43bae2cf41
// https://stackoverflow.com/questions/31438368/swift-whats-the-difference-between-metatype-type-and-self

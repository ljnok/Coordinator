//
//  DeepLink.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/18.
//

import Foundation

protocol Link: RawRepresentable {
}

class DeepLink: Node<Link> {
}

// Type, Protocol 관련
// https://sujinnaljin.medium.com/swift-generic%EA%B3%BC-subtype-c43bae2cf41
// https://stackoverflow.com/questions/31438368/swift-whats-the-difference-between-metatype-type-and-self

class DeepLink2<E: RawRepresentable> where E.RawValue == String {
    
    var value: E
    var children: [DeepLink2] = []
    
    init(value: E) {
        self.value = value
    }
    
    func add(child: DeepLink2) {
        children.append(child)
    }
    
    func remove(child: DeepLink2) {
        guard let index = children.firstIndex(where: { $0 === child})
        else { return }
        
        children.remove(at: index)
    }
}

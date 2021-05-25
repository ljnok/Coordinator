//
//  Stack.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/25.
//

import Foundation

public class Stack<T> {
    
    public var value: T
    
    public var items = [T]()
    
    public var count: Int {
        return items.count
    }
    
    public var isEmpty: Bool {
        return items.isEmpty
    }
    
    init(value: T) {
        self.value = value
    }
    
    public func push(_ element: T) {
        items.append(element)
    }
    
    public func pop() -> T? {
        return items.popLast()
    }
}

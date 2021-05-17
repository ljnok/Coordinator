//
//  NibIdentifiable.swift
//  Base_architecture
//
//  Created by ljnok on 2021/03/30.
//

import UIKit

protocol NibIdentifiable {
    static var nibIdentifier: String { get }
}

extension NibIdentifiable {
    static var nib: UINib {
        return UINib(nibName: nibIdentifier, bundle: nil)
    }
}

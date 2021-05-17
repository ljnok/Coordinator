//
//  UIViewController+Utils.swift
//  Base_architecture
//
//  Created by ljnok on 2021/03/30.
//

import UIKit

extension UIViewController: NibIdentifiable, StoryboardIdentifiable {
    var className: String {
        return String(describing: Self.self)
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var nibIdentifier: String {
        return String(describing: self)
    }
}

extension NibIdentifiable where Self: UIViewController {
    static func instantiateFromNib() -> Self {
        return Self(nibName: nibIdentifier, bundle: nil)
    }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static func instantiateFromStoryboard(bundle name: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}

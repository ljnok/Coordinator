//
//  Test.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/24.
//

import UIKit

protocol Router {
    associatedtype RouteType: Link
}

//class TestDeepLink<RouteType: Link>: Node<RouteType> {
//}


class TestDeepLink<RouteType: Link> {
    var value: RouteType
    var children: [String] = []
    
    init(value: RouteType) {
        self.value = value
    }
    
    func add(child: String) {
        children.append(child)
    }
    
    func remove(child: String) {
        guard let index = children.firstIndex(where: { $0 == child})
        else { return }
        
        children.remove(at: index)
    }
}


protocol TestCoordinator: Router {
    var children: [Coordinator] { get set }
    
    func start(_ deepLink: TestDeepLink<RouteType>?)
    
    func prepare(for route: TestDeepLink<RouteType>)
}


class BaseCoordinator<RouteType: Link>: TestCoordinator {
    
    var children: [Coordinator] = []
    
    func start(_ deepLink: TestDeepLink<RouteType>? = nil) {
        guard let link = deepLink else { return }
        prepare(for: link)
    }
    
    func prepare(for route: TestDeepLink<RouteType>) {
        fatalError("Please override the \(#function) method.")
    }
}

class ApplicationCoordinator: BaseCoordinator<AppLink> {
    
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        
        let viewController = AppViewController.instantiateFromStoryboard()
        //viewController.coordinator = self
        rootViewController.setViewControllers([viewController], animated: false)
    }
    
    override func prepare(for route: TestDeepLink<AppLink>) {
        switch route.value {
        case .login:
            let loginCoordinator = TempLoginCoordinator(rootViewController: rootViewController)
            loginCoordinator.start()

            //loginCoordinator.start(LoginLink(rawValue: subLink))
            //loginCoordinator.dismiss = didChildDismissed(_:)
            //let subLink = link.children.first(where: { $0.value is LoginLink })
            //loginCoordinator.start(subLink as? DeepLink)
        
        
            
        case .home:
            print("home.. \(route.children)")
        }
    }
}

class TempLoginCoordinator: BaseCoordinator<LoginLink> {
    
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        
        let viewController = LoginViewController.instantiateFromStoryboard()
        //viewController.coordinator = self
        rootViewController.pushViewController(viewController, animated: false)
    }
    
    override func prepare(for route: TestDeepLink<LoginLink>) {
    }
}

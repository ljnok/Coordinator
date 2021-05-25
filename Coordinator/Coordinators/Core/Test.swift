//
//  Test.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/24.
//

import UIKit

class TestDeepLink<T>: Node<Link> {
    var type: T {
        return self.value as! T
    }
}

//protocol TestCoordinator: Router {
//
//    var children: [TestCoordinator] { get set }
//
//    func start(_ deepLink: TestDeepLink<RouteType>?)
//
//    func prepare(for route: TestDeepLink<RouteType>)
//}

protocol TestCoordinator: Router {

    var children: [CoordinatorItem] { get set }

    func start(_ deepLink: TestDeepLink<RouteType>?)

    func prepare(for route: TestDeepLink<RouteType>)
}

//class BaseCoordinator<RouteType: Link>: TestCoordinator {
//    
//    var children: [Coordinator2] = []
//
//    func start(_ deepLink: TestDeepLink<RouteType>? = nil) {
//        guard let link = deepLink else { return }
//        prepare(for: link)
//    }
//
//    func prepare(for route: TestDeepLink<RouteType>) {
//        fatalError("Please override the \(#function) method.")
//    }
//}

//class ApplicationCoordinator: BaseCoordinator<AppLink> {
//
//    var rootViewController: UINavigationController
//
//    init(rootViewController: UINavigationController) {
//        self.rootViewController = rootViewController
//
//        let viewController = AppViewController.instantiateFromStoryboard()
//        //viewController.coordinator = self
//        rootViewController.setViewControllers([viewController], animated: false)
//    }
//
//    override func prepare(for link: TestDeepLink<AppLink>) {
//        switch link.type {
//        case .login:
//
//            if let subLink = route.children.first(where: { $0.value is LoginLink }) {
//                print("Login!!: \(subLink) - \(subLink.value)")
//            }
//
//        case .home:
//            print("Home!!: \(route.children)")
//        }
//    }
//}


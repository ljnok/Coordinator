//
//  HomeViewController.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

class HomeViewController: UIViewController {

    var coordinator: HomeCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Home"
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        if parent == nil {
            coordinator.backButtonPressed()
        }
    }
}

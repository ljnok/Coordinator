//
//  AppViewController.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

class AppViewController: UIViewController {

    var coordinator: AppCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
        coordinator.loginButtonPressed()
    }
    
    @IBAction func btnHomePressed(_ sender: Any) {
        coordinator.homeButtonPressed()
    }
}

//
//  LoginViewController.swift
//  Coordinator_Task1
//
//  Created by ljnok on 2021/05/17.
//

import UIKit

class LoginViewController: UIViewController {

    var coordinator: LoginCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Login"
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        if parent == nil {
            coordinator.backButtonPressed()
        }
    }
    
    @IBAction func btnSignUpPressed(_ sender: Any) {
        coordinator.signUpButtonPressed()
    }
}

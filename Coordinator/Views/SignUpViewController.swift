//
//  SignUpViewController.swift
//  Coordinator
//
//  Created by ljnok on 2021/05/25.
//

import UIKit

class SignUpViewController: UIViewController {

    var coordinator: SignUpCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "SignUp"
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        if parent == nil {
            coordinator.backButtonPressed()
        }
    }

}

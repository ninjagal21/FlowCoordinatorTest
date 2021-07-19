//
//  ViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let flowCF: FlowCoordinatorFactoryProtocol = FlowCoordinatorFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let flowCoordinator = flowCF.getCoordinator(navigationController: self.navigationController ?? UINavigationController(), type: .signUpFlow(user: nil)) { type in
            if case .signUpFlow(let user) = type {
                print(user)
            }
        }
        flowCoordinator.startFlow()
    }
}


//
//  ViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 05.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let flowCF: FlowCoordinatorFactoryProtocol = FlowCoordinatorFactory()
    var viewModel: MainViewModelProtocol = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginAction(_ sender: Any) {
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        var dataMode: FlowDataMode = .create
        if let user = viewModel.user {dataMode = .edit(user: user)}
        let flowCoordinator = flowCF.getCoordinator(navigationController: self.navigationController ?? UINavigationController(), type: .signUpFlow(user: nil), dataMode: dataMode) { [weak self] type in
            if case .signUpFlow(let user) = type {
                self?.viewModel.user = user
                print(user ?? "no values")
            }
        }
        flowCoordinator.startFlow()
    }
}


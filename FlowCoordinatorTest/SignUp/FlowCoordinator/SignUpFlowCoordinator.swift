//
//  FlowCoordinator.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 05.07.2021.
//

import Foundation
import UIKit

protocol SignUpVCDelegate: AnyObject {
    func nextAction(stepType: SignUpFlowCoordinator.SignUpVCStep?)
    func backButtonAction()
    
}

class SignUpFlowCoordinator: FlowCoordinatorProtocol {
    enum SignUpVCStep {
        case name(String?)
        case surname(String?)
        case dob(String?)
    }
    
    weak var navigationController: UINavigationController?
    
    let signUpDataManager: SignupDataManagerProtocol
    let signUpVCFactory: SignupVCFactoryProtocol = SignUpVCFactory()
    
    let comletionCallback: ((FlowType) -> ())
    
    required init(navigationController: UINavigationController, dataMode: FlowDataMode, comletionCallback: @escaping ((FlowType) -> ())) {
        self.comletionCallback = comletionCallback
        self.navigationController = navigationController
        
        signUpDataManager = SignupDataManager(dataMode: dataMode, steps: [.name(nil), .surname(nil), .dob(nil)])
    }
    
    func startFlow() {
        nextAction(stepType: nil)
    }
    
}

extension SignUpFlowCoordinator: SignUpVCDelegate {
    func backButtonAction() {
        signUpDataManager.updateCurrentStep(type: .decrease)
    }

    func nextAction(stepType: SignUpVCStep?) {
        if let step = stepType {
            signUpDataManager.setData(by: step)
        }
        guard let nextStep = signUpDataManager.getNextStep() else {
            comletionCallback(.signUpFlow(user: signUpDataManager.user))
            navigationController?.popToRootViewController(animated: true)
            return
        }
        
        let nextVC = signUpVCFactory.getVC(with: nextStep)
        nextVC.delegate = self

        navigationController?.pushViewController(nextVC, animated: true)
        signUpDataManager.updateCurrentStep(type: .increase)
    }

}

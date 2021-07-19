//
//  FlowCoordinator.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 05.07.2021.
//

import Foundation
import UIKit

enum SignUpVCStep {
    case name(String?)
    case surname(String?)
    case dob(String?)
}

protocol SignUpVCDelegate: AnyObject {
    func nextAction(stepType: SignUpVCStep)
    func backButtonAction()
}

class SignUpFlowCoordinator: FlowCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    
    let signUpDataManager = SignupDataManager(user: nil, steps: [.name(nil), .surname(nil), .dob(nil)]) //protocol
    let signUpVCFactory = SignUpVCFactory() //prot init
    
    let comletionCallback: ((FlowType) -> ())
    
    required init(navigationController: UINavigationController, comletionCallback: @escaping ((FlowType) -> ())) {
        self.comletionCallback = comletionCallback
        self.navigationController = navigationController
    }
    
    func startFlow() {
        if let nextStep = signUpDataManager.getNextStep() {
            nextAction(stepType: nextStep)
        }
    }
}

extension SignUpFlowCoordinator: SignUpVCDelegate {
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }

    func nextAction(stepType: SignUpVCStep) {
        signUpDataManager.setData(by: stepType)
        guard let nextStep = signUpDataManager.getNextStep() else {
            comletionCallback(.signUpFlow(user: signUpDataManager.user))
            navigationController?.popToRootViewController(animated: true)
            return
        }
        let nextVC = signUpVCFactory.getVC(with: nextStep)
        nextVC?.delegate = self
        guard let nextVC = nextVC else {
            comletionCallback(FlowType.signUpFlow(user: signUpDataManager.user))
            return
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

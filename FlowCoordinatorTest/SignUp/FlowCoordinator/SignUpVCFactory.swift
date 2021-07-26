//
//  SignUpVCFactory.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 19.07.2021.
//

import Foundation

protocol SignupVCFactoryProtocol {
    func getVC(with type: SignUpFlowCoordinator.SignUpVCStep) -> SignUpVCProtocol
}

class SignUpVCFactory: SignupVCFactoryProtocol {
    func getVC(with type: SignUpFlowCoordinator.SignUpVCStep) -> SignUpVCProtocol {
        switch type {
        case .name(let name):
            return NameSignUpViewController(name: name)
        case .surname(let surname):
            return SurnameSignUpViewController(surname: surname)
        case .dob(let dob):
            return DateOfBirthViewController(dob: dob)
        }
    }
}

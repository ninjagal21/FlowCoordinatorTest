//
//  SignUpVCFactory.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 19.07.2021.
//

import Foundation

class SignUpVCFactory {
    func getVC(with type: SignUpVCStep) -> SignUpVCProtocol? {
        switch type {
        case .name(_):
            return NameSignUpViewController()
        case .surname(_):
            return SurnameSignUpViewController()
        case .dob(_):
            return DateOfBirthViewController()
        }
    }
}

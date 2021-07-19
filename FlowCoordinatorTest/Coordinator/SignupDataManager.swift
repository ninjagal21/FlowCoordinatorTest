//
//  VCManager.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 16.07.2021.
//

import Foundation
import UIKit

class SignupDataManager {
    
    var user: User
    var steps: [SignUpVCStep]
    
    init(user: User?, steps: [SignUpVCStep]) {
        self.user = user ?? User()
        self.steps = steps
    }
        
    func setData(by step: SignUpVCStep) {
        switch step {
        case .name(let name):
            guard let name = name else {
                return
            }
            if !name.contains(" ") {
                user.name = name
            } else {
                let fullNameArray = name.components(separatedBy: " ")
                user.name = fullNameArray[0]
                user.surname = fullNameArray[1]
            }
        case .surname(let surname):
            user.surname = surname
        case .dob(let dob):
            user.birthdate = dob
        }
    }
    
     func getNextStep() -> SignUpVCStep? {
        for step in steps {
            switch step {
            case .name:
                if user.name == nil {return .name(nil)}
            case .surname(_):
                if user.surname == nil {return .surname(nil)}
            case .dob(_):
                if user.birthdate == nil {return .dob(nil)}
            }
        }
        
        return nil
    }
}

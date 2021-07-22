//
//  VCManager.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 16.07.2021.
//

import Foundation
import UIKit

protocol SignupDataManagerProtocol {
    var user: User {get}
    var steps: [SignUpVCStep] {get}
    
    var dataMode: FlowDataMode {get}
    
    init(dataMode: FlowDataMode, steps: [SignUpVCStep])
    
    func setData(by step: SignUpVCStep)
    func getNextStep() -> SignUpVCStep?
    func decreaseStep()
}

class SignupDataManager: SignupDataManagerProtocol {
    var dataMode: FlowDataMode
    
    var user = User()
    var steps: [SignUpVCStep]
    
    private var currentStep = 0
    
    required init(dataMode: FlowDataMode, steps: [SignUpVCStep]) {
        if case .edit(let user) = dataMode {
            self.user = user
        }
        
        self.steps = steps
        self.dataMode = dataMode
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
        currentStep += 1
    }
    
     func getNextStep() -> SignUpVCStep? {
        if case .create = dataMode {
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
        }
        
        if case .edit(_) = dataMode {
            if !steps.indices.contains(currentStep) {
                return nil
            }
            
            let step = steps[currentStep]
            switch step {
            case .name(_):
                return .name(user.name)
            case .surname(_):
                return .surname(user.surname)
            case .dob(_):
                return .dob(user.birthdate)
            }
        }
        
        return nil
    }
    
    func decreaseStep() {
        currentStep -= 1
    }
    
}

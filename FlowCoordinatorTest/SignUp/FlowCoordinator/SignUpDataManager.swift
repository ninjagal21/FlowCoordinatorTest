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
    var steps: [SignUpFlowCoordinator.SignUpVCStep] {get}
    
    var dataMode: FlowDataMode {get}
    
    init(dataMode: FlowDataMode, steps: [SignUpFlowCoordinator.SignUpVCStep])
    
    func setData(by step: SignUpFlowCoordinator.SignUpVCStep)
    func getNextStep() -> SignUpFlowCoordinator.SignUpVCStep?
    func updateCurrentStep(type: SignupDataManager.StepChangeType)
    
}

class SignupDataManager: SignupDataManagerProtocol {
    enum StepChangeType {
        case increase
        case decrease
    }
    
    var dataMode: FlowDataMode
    
    var user = User()
    var steps: [SignUpFlowCoordinator.SignUpVCStep]
    
    private var currentStep = 0
    
    required init(dataMode: FlowDataMode, steps: [SignUpFlowCoordinator.SignUpVCStep]) {
        if case .edit(let user) = dataMode {
            self.user = user
        }
        
        self.steps = steps
        self.dataMode = dataMode
    }
        
    func setData(by step: SignUpFlowCoordinator.SignUpVCStep) {
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
    
    func getNextStep() -> SignUpFlowCoordinator.SignUpVCStep? {
        switch dataMode {
        case .create:
            return getCreateNextStep()
        case .edit:
            return getEditNextStep()
        }
    }
    
    private func getCreateNextStep() -> SignUpFlowCoordinator.SignUpVCStep? {
        for step in steps {
            switch step {
            case .name:
                if user.name == nil {return .name(nil)}
            case .surname:
                if user.surname == nil {return .surname(nil)}
            case .dob:
                return user.birthdate == nil ? .dob(nil) : nil
            }
        }
        return nil
    }
    
    private func getEditNextStep() -> SignUpFlowCoordinator.SignUpVCStep? {
        if !steps.indices.contains(currentStep) {
            return nil
        }
        
        let step = steps[currentStep]
        switch step {
        case .name:
            return .name(user.name)
        case .surname:
            return .surname(user.surname)
        case .dob:
            return .dob(user.birthdate)
        }
    }
    
    func updateCurrentStep(type: SignupDataManager.StepChangeType) {
        switch type {
        case .increase:
            currentStep += 1
        case .decrease:
            currentStep -= 1
        }
    }
    
}

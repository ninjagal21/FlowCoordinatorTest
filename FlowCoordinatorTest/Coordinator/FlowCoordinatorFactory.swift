//
//  FlowCoordinatorFactory.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 05.07.2021.
//

import Foundation
import UIKit

enum FlowType {
    case signUpFlow(user: User?)
    case loginFlow
    
}

protocol FlowCoordinatorProtocol {
    var navigationController: UINavigationController? {get}
    func startFlow()
    
    init(navigationController: UINavigationController, comletionCallback: (@escaping (FlowType) -> ()))
    
}

protocol FlowCoordinatorFactoryProtocol {
     func getCoordinator(navigationController: UINavigationController, type: FlowType, completionCallback: @escaping (FlowType) -> ()) -> FlowCoordinatorProtocol
    
}

class FlowCoordinatorFactory: FlowCoordinatorFactoryProtocol {
     func getCoordinator(navigationController: UINavigationController, type: FlowType, completionCallback: @escaping (FlowType) -> ()) -> FlowCoordinatorProtocol {
        
        switch type {
        case .signUpFlow(_):
            return SignUpFlowCoordinator(navigationController: navigationController, comletionCallback: completionCallback)
        case .loginFlow:
            break
        }
        
        return SignUpFlowCoordinator(navigationController: navigationController, comletionCallback: completionCallback)
    }
    
}

//
//  SignUpBaseViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 22.07.2021.
//

import UIKit

protocol SignUpVCProtocol: UIViewController {
    var delegate: SignUpVCDelegate? {get set}
}

class SignUpBaseViewController: UIViewController, SignUpVCProtocol {

    var delegate: SignUpVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            delegate?.backButtonAction()
        }
    }
}

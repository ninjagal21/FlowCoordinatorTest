//
//  SignUpViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 13.07.2021.
//

import UIKit

protocol SignUpVCProtocol: UIViewController {
    var delegate: SignUpVCDelegate? {get set}
}

class NameSignUpViewController: UIViewController, SignUpVCProtocol {
    var delegate: SignUpVCDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextAction(_ sender: Any) {
        delegate?.nextAction(stepType: SignUpVCStep.name(textField.text))
    }
}

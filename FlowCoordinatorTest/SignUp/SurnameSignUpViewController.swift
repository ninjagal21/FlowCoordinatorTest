//
//  SurnameSignUpViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 13.07.2021.
//

import UIKit

class SurnameSignUpViewController: UIViewController, SignUpVCProtocol {
    
    @IBOutlet weak var textField: UITextField!
    var delegate: SignUpVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func nextAction(_ sender: Any) {
        delegate?.nextAction(stepType: SignUpVCStep.surname(textField.text))
    }
}

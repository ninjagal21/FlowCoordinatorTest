//
//  DateOfBirthViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 19.07.2021.
//

import UIKit

class DateOfBirthViewController: UIViewController, SignUpVCProtocol {

    @IBOutlet weak var textField: UITextField!
    
    var delegate: SignUpVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func nextAction(_ sender: Any) {
        delegate?.nextAction(stepType: .dob(textField.text))
    }
}

//
//  SurnameSignUpViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 13.07.2021.
//

import UIKit

class SurnameSignUpViewController: SignUpBaseViewController {
    
    private let surname: String?
    
    @IBOutlet weak var textField: UITextField!
    
    init(surname: String?) {
        self.surname = surname
        super.init(nibName: "SurnameSignUpViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = surname
    }

    @IBAction func nextAction(_ sender: Any) {
        delegate?.nextAction(stepType: SignUpFlowCoordinator.SignUpVCStep.surname(textField.text))
    }
    
}

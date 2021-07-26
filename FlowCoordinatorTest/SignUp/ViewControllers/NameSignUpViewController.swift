//
//  SignUpViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 13.07.2021.
//

import UIKit

class NameSignUpViewController: SignUpBaseViewController {
    var name: String?
    
    @IBOutlet weak var textField: UITextField!
    
    init(name: String?) {
        self.name = name
        super.init(nibName: "NameSignUpViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = name
    }

    @IBAction func nextAction(_ sender: Any) {
        delegate?.nextAction(stepType: SignUpFlowCoordinator.SignUpVCStep.name(textField.text))
    }
    
}

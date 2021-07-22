//
//  DateOfBirthViewController.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 19.07.2021.
//

import UIKit

class DateOfBirthViewController: SignUpBaseViewController {

    @IBOutlet weak var textField: UITextField!
    
    private let dob: String?
    
    init(dob: String?) {
        self.dob = dob
        super.init(nibName: "DateOfBirthViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = dob
    }

    @IBAction func nextAction(_ sender: Any) {
        delegate?.nextAction(stepType: .dob(textField.text))
    }
    
}

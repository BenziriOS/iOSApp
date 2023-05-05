//
//  ViewController.swift
//  TextfieldValidationApp
//
//  Created by Jahangir Bavra on 13/04/23.
//

import UIKit
import ValidationTextField

class ViewController: UIViewController {

    @IBOutlet weak var txt_email: ValidationTextField!
    @IBOutlet weak var txt_confirmpass: ValidationTextField!
    @IBOutlet weak var txt_password: ValidationTextField!
    @IBOutlet weak var txt_username: ValidationTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationTextfield()
        // Do any additional setup after loading the view.
    }

    func validationTextfield()
    {
        txt_username.validCondition={$0.count > 5}
        txt_email.validCondition={$0.count > 5 && $0.contains("@")}
        txt_password.validCondition={$0.count > 8}
        txt_confirmpass.validCondition = {
            guard let pas = self.txt_password.text else
            {
                return false
            
            }
            return $0 == pas
        }
    }

}


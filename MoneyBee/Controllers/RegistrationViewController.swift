//
//  RegistrationViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/9/23.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func creatAccountButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
    


}

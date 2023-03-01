//
//  RegistrationViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/9/23.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let modelView = RegistrationViewModel()
    
    
    
    //MARK: - Public Methods
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    //MARK: - IBActions
    @IBAction func creatAccountButtonPressed(_ sender: UIButton) {
        guard let username = userNameTextField.text, let firstname = firstNameTextField.text,
              let lastname = lastNameTextField.text, let password = passwordTextField.text else { return }
        
        if username.count > 2 && password.count > 6 {
            modelView.checkExistingUser(username: username) { result in
                if result {
                    self.modelView.registrationNewUser(login: username, pass: password, first: firstname, last: lastname)
                    self.customAlert(title: "Sucess", message: "Congratulation User Successufully created") { _ in
                        self.dismiss(animated: true)
                    }
                    
                } else {
                    self.customAlert(title: "Error Registration", message: "User with this login already exists", handler: nil)
                    self.userNameTextField.text = ""
                }
            }
        } else {
            if username.count < 2 {
                customAlert(title: "Username Error", message: "Username too short, must be minimum 2 characters, now it contains only \(username.count)", handler: nil)
            } else if password.count < 6 {
                customAlert(title: "Password Error", message: "Password too short, must be minimum 6 characters, now it contains only \(password.count)", handler: nil)
            }
        }
    }
        
}
    



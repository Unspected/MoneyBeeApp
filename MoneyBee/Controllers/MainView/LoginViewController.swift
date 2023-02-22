//
//  ViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/9/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userData: [String: String] = ["user": "unspected",
                                      "password": "n8qwlgs5b8a"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        hideKeyboardOnTap()
        setupTextFieldViews(userNameTextField)
        setupTextFieldViews(passwordTextField)
        
        
        
    }
    
    // MARK: - functions @IBOoutlets
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        secondVC.modalPresentationStyle = .fullScreen
        
        if validUserName() && validUserName() {
            self.present(secondVC, animated: true)
        } else {
            print("Wrong")
        }
    }
    

    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        print("CreateAnAcoountPressed")
    }
    
    
}

// MARK: - Validation Functions

extension LoginViewController {
    
    func validUserName() -> Bool {
        if userNameTextField.text != nil {
            return true
        } else {
            return false
        }
    }
    
    func validPassword() -> Bool {
        if passwordTextField.text != nil {
            return true
        } else {
            return false
        }
    }
    
    func setupTextFieldViews(_ textField: UITextField) {
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
    }
    
    
}

// MARK: - TextField Delegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}



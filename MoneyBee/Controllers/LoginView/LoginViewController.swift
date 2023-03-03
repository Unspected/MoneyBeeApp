//
//  ViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/9/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userData: [String: String] = ["user": "unspected",
                                      "password": "n8qwlgs5b8a"]
    
    private let modelView = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        loginTextField.delegate = self
        passwordTextField.delegate = self
        hideKeyboardOnTap()
        setupTextFieldViews(loginTextField)
        setupTextFieldViews(passwordTextField)
        
    }
    
    // MARK: - functions @IBOoutlets
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        guard let saveLogin = loginTextField.text, let savePassword = passwordTextField.text else { return }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        
        modelView.authorization(login: saveLogin, password: savePassword) { [weak self] success in
            if success {
                secondVC.modalPresentationStyle = .fullScreen
                self?.present(secondVC, animated: true)
            } else {
                self?.customAlert(title: "Authorization Error", message: "Wrong Login or Password", handler: nil)
                self?.loginTextField.text = ""
                self?.passwordTextField.text = ""
                
            }
        }
 
    }
    
}


// MARK: - TextField Delegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}



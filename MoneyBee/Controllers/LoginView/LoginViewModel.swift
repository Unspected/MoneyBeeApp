//
//  LoginViewModel.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/22/23.
//

import Foundation

class LoginViewModel {
    
    func authorization(login: String, password: String, completion: @escaping(Bool) -> Void) {
        let result = DataManager.shared.loadUserData()
        if login == result.first?.login {
            print("Sucess")
            completion(true)
        } else {
            print("error")
            completion(false)
        }
        
    }
}

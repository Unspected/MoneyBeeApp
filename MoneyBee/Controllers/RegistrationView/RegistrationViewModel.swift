//
//  RegistrationViewModel.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/28/23.
//

import Foundation
import UIKit

class RegistrationViewModel {
    
    var users: ObservableObject<[UserData]> = ObservableObject([])
    
    func registrationNewUser(login: String, pass: String, first: String, last: String) {
        let newUser = DataManager.shared.registration(login: login, password: pass, firstname: first, lastname: last)
        self.users.value.append(newUser)
        DataManager.shared.save()
        print("Success saving")
    }
    
    func checkExistingUser(username: String, complition: @escaping (Bool) ->Void) {
        if DataManager.shared.checkExistedUser(login: username) {
            complition(true)
        } else {
            complition(false)
        }
    }
    
    
}
                
                


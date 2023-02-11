//
//  HideKeyboard + Extension.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/10/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func hideKeyBoard() {
        self.view.endEditing(true)
    }
    
}

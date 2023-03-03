//
//  UITextField + Extensions.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 3/2/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupTextFieldViews(_ textField: UITextField) {
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
    }
}

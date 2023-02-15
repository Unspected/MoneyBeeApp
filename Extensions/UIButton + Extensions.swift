//
//  UIButton + Extensions.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/13/23.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(nameButton: String? ) {
        self.init(type: .system)
        self.setTitle(nameButton, for: .normal)
        self.layer.cornerRadius = 5
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 50))
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor(named: "textColor")
        
    }
}

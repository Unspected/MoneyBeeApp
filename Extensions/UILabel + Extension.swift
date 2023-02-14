//
//  UILabel + Extension.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/13/23.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(text: String, fontSize: CGFloat) {
        self.init()
        self.text = text
        self.font = UIFont(name: "SFProDisplay-Regular", size: fontSize)
        self.textColor = UIColor(named: "textColor")
        self.numberOfLines = 1
        self.textAlignment = .center
        }
  
}

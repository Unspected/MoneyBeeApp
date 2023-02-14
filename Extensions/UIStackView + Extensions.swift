//
//  UIStackView + Extensions.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/13/23.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
       // self.translatesAutoresizingMaskIntoConstraints = false
    }
}

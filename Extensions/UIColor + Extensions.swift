//
//  UIColor + Extensions.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/9/23.
//

import Foundation
import UIKit

extension UIColor {
    static let backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1098039216, blue: 0.1450980392, alpha: 1)
    static let textFieldForegound = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.2784313725, alpha: 1)
    static let colorButton1 = #colorLiteral(red: 0.3294117647, green: 0.6431372549, blue: 0.7490196078, alpha: 1)
    static let colorButton2 = #colorLiteral(red: 0.3921568627, green: 0.2745098039, blue: 0.6666666667, alpha: 1)
}

extension UIView {
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 4.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

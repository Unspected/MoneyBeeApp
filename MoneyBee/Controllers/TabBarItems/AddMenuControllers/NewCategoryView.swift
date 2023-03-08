//
//  TestView.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 3/3/23.
//

import UIKit

class NewCategoryView: UIView {
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let categoryTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .textFieldForegound
        return textField
    }()
    
    let button: UIButton = {
       let button = GradientButton(nameButton: "Add New Category")
        button.startColor = .colorButton1
        button.endColor = .colorButton2
        return button
    }()
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        addSubview(label)
//      //  print("ADD TEST VIEW")
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupView() {
        //translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            label.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
    }
    

}

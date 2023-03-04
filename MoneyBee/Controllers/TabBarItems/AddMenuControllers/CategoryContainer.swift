//
//  TestView.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 3/3/23.
//

import UIKit

class CategoryContainer: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let label: UILabel = {
        let label = UILabel(text: "FUCK", fontSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        setupView()
        print("ADD TEST VIEW")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        //translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .brown
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
    }
    

}

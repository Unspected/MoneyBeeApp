//
//  GoalViewCell.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/27/23.
//

import UIKit

class GoalViewCell: UICollectionViewCell {
    
    static let identifer = "goalCell"
    
    let goalLabel: UILabel = {
       let label = UILabel(text: "Goal", fontSize: 20)
        return label
    }()
    
    let nameOfGoalLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHexogon()
        contentView.addSubview(goalLabel)
        contentView.layer.addSublayer(shapeLayer)
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
   
    }
    
    private func setupHexogon()  {
        let path = UIBezierPath()
        let sideLength: CGFloat = 70.0 // Length of each side of the hexagon
        let numberOfSides = 6 // Number of sides in the hexagon
        let center = CGPoint(x: frame.width / 2, y: frame.height / 3) // Center of the hexagon
        path.move(to: CGPoint(x: center.x + sideLength * cos(0.0), y: center.y + sideLength * sin(0.0)))
        for side in 1...numberOfSides {
            let angle = CGFloat(side) * (2.0 * .pi) / CGFloat(numberOfSides)
            path.addLine(to: CGPoint(x: center.x + sideLength * cos(angle), y: center.y + sideLength * sin(angle)))
        }
        path.close()
        self.shapeLayer.path = path.cgPath
        // Set the properties of the shape layer
        self.shapeLayer.strokeColor = UIColor(named: "tabBarColor")?.cgColor
        self.shapeLayer.lineWidth = 15.0
        self.shapeLayer.fillColor = UIColor.clear.cgColor
       // return shapeLayer
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20)
        
        ])
    }
    
}

//
//  TabBarController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/12/23.
//

import UIKit



class TabBarController: UITabBarController {
    
    let popUpFrame: UIView = {
        let frame = UIView()
        frame.backgroundColor = UIColor(named: "tabBarColor")
        frame.layer.cornerRadius = 25
        return frame
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self

    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Add" {
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        
        if  viewController.tabBarItem.title == "Add" {
            // MARK: - init buttons
            let goalButton = UIButton(nameButton: "Saving Goal")
            let transactionButton = UIButton(nameButton: "Transaction")
            let categoryButton = UIButton(nameButton: "Category")
            
            
            goalButton.addTarget(self, action: #selector(popupButtonPressed), for: .touchUpInside)
            transactionButton.addTarget(self, action: #selector(popupButtonPressed), for: .touchUpInside)
            categoryButton.addTarget(self, action: #selector(popupButtonPressed), for: .touchUpInside)
            
            // MARK: - init labels
            let goalLabel = UILabel(text: "Saving Goal", fontSize: 13)
            let transactionLabel = UILabel(text: "Transaction", fontSize: 13)
            let categoryLabel = UILabel(text: "Categoty", fontSize: 13)
            
            // MARK: - init stacks
            let goalStack = UIStackView(arrangedSubviews: [goalButton, goalLabel], axis: .vertical, spacing: 10)
            let transactionStack = UIStackView(arrangedSubviews: [transactionButton, transactionLabel], axis: .vertical, spacing: 10)
            let categoryStack = UIStackView(arrangedSubviews: [categoryButton, categoryLabel], axis: .vertical, spacing: 10)
            
            let currentView = tabBarController.selectedViewController!.view!
            
            
            // MARK: - setup constrains
            popUpFrame.frame.size = CGSize(width: (view.frame.width / 2) + 100, height: 140)
            popUpFrame.frame.origin.x = (currentView.frame.size.width - self.popUpFrame.frame.size.width) / 2
            popUpFrame.frame.origin.y = self.view.frame.height - 300
            popUpFrame.alpha = 0
            
            let triangle = UIImage(named: "triangle")
            let imageView = UIImageView(image: triangle)
            imageView.frame = CGRect(x: 50, y: popUpFrame.frame.size.height + 1, width: popUpFrame.frame.size.width / 2, height: popUpFrame.frame.size.height / 2)
            popUpFrame.addSubview(imageView)
            
            UIView.animate(withDuration: 0.5) {
                self.popUpFrame.alpha = 1
            }
            
            let fullStackMenu = UIStackView(arrangedSubviews: [goalStack, transactionStack, categoryStack], axis: .horizontal, spacing: 15)
            fullStackMenu.distribution = .fillEqually
            
            fullStackMenu.frame = CGRect(x: popUpFrame.frame.size.width / 12, y: 20, width: popUpFrame.frame.width - 50, height: popUpFrame.frame.size.height - 40)
            popUpFrame.addSubview(fullStackMenu)
            
            currentView.addSubview(popUpFrame)
            currentView.bringSubviewToFront(popUpFrame)
            return false
        } else {
            
            popUpFrame.removeFromSuperview()
            return true
        }
    }
    
    
    
    @objc func popupButtonPressed(_ sender:UIButton) {
        
        if sender.titleLabel?.text == "Saving Goal" {
            print("saving Goal")
        } else if sender.titleLabel?.text == "Transaction" {
            print("transaction")
        } else {
            print("Category")
        }
        
    }
    @objc func settingButtonPresssed(_ sender:UIButton){
        if let parentStackView = sender.superview as? UIStackView {
            parentStackView.removeFromSuperview()
            if let tabBC = UIApplication.shared.windows[0].rootViewController as? UITabBarController {
                tabBC.selectedIndex = 2
            }
        }
    }
    
    
  
    
}

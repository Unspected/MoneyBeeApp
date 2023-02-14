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
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
    }
    

}


extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let vcIndex = tabBarController.viewControllers!.firstIndex(of: viewController)!
        if  vcIndex == 2 {
            
            // MARK: - init buttons
            let goalButton = UIButton(nameButton: nil)
            let transactionButton = UIButton(nameButton: nil)
            let categoryButton = UIButton(nameButton: nil)
            
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
            popUpFrame.frame.size = CGSize(width: (view.frame.width / 2) + 100, height: 120)
            popUpFrame.frame.origin.x = (currentView.frame.size.width - popUpFrame.frame.size.width) / 2
            popUpFrame.frame.origin.y = view.frame.height - 210
           
            
            let fullStackMenu = UIStackView(arrangedSubviews: [goalStack, transactionStack, categoryStack], axis: .horizontal, spacing: 15)
            fullStackMenu.distribution = .fillEqually
            
            fullStackMenu.frame = CGRect(x: popUpFrame.frame.size.width / 12, y: 0, width: popUpFrame.frame.width - 50, height: popUpFrame.frame.size.height - 20)
            popUpFrame.addSubview(fullStackMenu)
            
        
            currentView.addSubview(popUpFrame)
            currentView.bringSubviewToFront(popUpFrame)
            return false
            
            } else {
             return true
        }
    }

    @objc func cancelButtonPressed(_ sender:UIButton) {
//        if let parentStackView = sender.superview as? UIStackView {
//            parentStackView.removeFromSuperview()
//        }
        print("sender.titleLabel")
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

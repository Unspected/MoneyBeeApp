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
        frame.alpha = 0
        return frame
    }()
    
    let goalButton = UIButton(nameButton: "Saving Goal")
    let transactionButton = UIButton(nameButton: "Transaction")
    let categoryButton = UIButton(nameButton: "Category")
    
    
    // MARK: - init labels
    let goalLabel = UILabel(text: "Saving Goal", fontSize: 13)
    let transactionLabel = UILabel(text: "Transaction", fontSize: 13)
    let categoryLabel = UILabel(text: "Categoty", fontSize: 13)
    
    // MARK: - init stacks
    var goalStack = UIStackView()
    var transactionStack = UIStackView()
    var categoryStack = UIStackView()
    var fullStackMenu = UIStackView()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "triangle"))
        return imageView
    }()
    
    var currentView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        setupButtons()
        setupStacks()
        popUpFrame.addSubview(fullStackMenu)
        popUpFrame.addSubview(imageView)
        
    }
    
    func setupButtons() {
        goalButton.addTarget(self, action: #selector(popupButtonPressed), for: .touchUpInside)
        transactionButton.addTarget(self, action: #selector(popupButtonPressed), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(popupButtonPressed), for: .touchUpInside)
    }
    
    func setupStacks() {
        goalStack = UIStackView(arrangedSubviews: [goalButton, goalLabel], axis: .vertical, spacing: 10)
        transactionStack = UIStackView(arrangedSubviews: [transactionButton, transactionLabel], axis: .vertical, spacing: 10)
        categoryStack = UIStackView(arrangedSubviews: [categoryButton, categoryLabel], axis: .vertical, spacing: 10)
        
        fullStackMenu = UIStackView(arrangedSubviews: [goalStack, transactionStack, categoryStack], axis: .horizontal, spacing: 15)
        fullStackMenu.distribution = .fillEqually
    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Add" {
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if  viewController.tabBarItem.title == "Add" {
            
            currentView = tabBarController.selectedViewController!.view!
            
            // MARK: - SetUP Constrains
            popUpFrame.frame.size = CGSize(width: (view.frame.width / 2) + 100, height: 140)
            popUpFrame.frame.origin.x = (currentView.frame.size.width - self.popUpFrame.frame.size.width) / 2
            popUpFrame.frame.origin.y = self.view.frame.height - 300
            fullStackMenu.frame = CGRect(x: popUpFrame.frame.size.width / 12, y: 20, width: popUpFrame.frame.width - 50, height: popUpFrame.frame.size.height - 40)
            
            imageView.frame = CGRect(x: 50, y: popUpFrame.frame.size.height + 1, width: popUpFrame.frame.size.width / 2, height: popUpFrame.frame.size.height / 2)
            
            UIView.animate(withDuration: 0.5) {
                self.popUpFrame.alpha = 1
            }
            
            currentView.addSubview(popUpFrame)
            currentView.bringSubviewToFront(popUpFrame)
            return false
        } else {
            removePopupFromSuperView()
            
            return true
        }
    }
    
    
    
    @objc func popupButtonPressed(_ sender:UIButton) {
        
        let newCategory = storyboard?.instantiateViewController(withIdentifier: "Category") as! NewCategoryViewController
        newCategory.modalPresentationStyle = .fullScreen
        newCategory.modalTransitionStyle = .coverVertical
        
        if sender.titleLabel?.text == "Saving Goal" {
            print("saving Goal")
        } else if sender.titleLabel?.text == "Transaction" {
            print("transaction")
        } else if sender.titleLabel?.text == "Category" {
            present(newCategory, animated: true)
            removePopupFromSuperView()
        }
        
    }
    
    func removePopupFromSuperView() {
        popUpFrame.removeFromSuperview()
        popUpFrame.alpha = 0
    }
    
  
    
}

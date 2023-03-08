//
//  AddCategoryViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/12/23.
//

import UIKit


class AddViewController: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    
    var typeView: String?
    
    @IBOutlet weak var categoryView: NewCategoryView!
    
    @IBOutlet weak var transactionView: NewTransactionView!
    
    
    @IBOutlet weak var savingGoalView: NewSavingGoalView!
    
    // New Category View Container located in file CategoryContainer
//    let newCategoryView: UIView = {
//        let view = NewCategoryView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryView.isHidden = true
        transactionView.isHidden = true
        savingGoalView.isHidden = true
        typeOfViewController()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//          testView.translatesAutoresizingMaskIntoConstraints = false
//          view.addSubview(testView)
        categoryView.isHidden = true
        transactionView.isHidden = true
        savingGoalView.isHidden = true
        typeOfViewController()
    }
    
    
}

extension AddViewController: MenuControllerDelegate {
    
    
    func typeOfViewController() {
        if self.typeView == "Category" {
            categoryView.isHidden = false
        } else if self.typeView == "Transaction" {
            transactionView.isHidden = false
        } else {
            savingGoalView.isHidden = false
        }
        
    }
    
}






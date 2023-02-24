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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeOfViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        typeOfViewController()
    }
    
    
}

extension AddViewController: TabControllerDelegate {
    
    
    // ИСПОЛЬЗОВАТЬ ЮЗЕР ДАТУ UserDefault
    func typeOfViewController() {
        if self.typeView == "Category" {
            newCategoryView()
        } else if self.typeView == "Transaction" {
            newTransactionView()
        } else {
            newSavingGoalView()
        }
        
        
    }
    
    
    func newSavingGoalView() {
        self.mainTitle.text = "New Saving Goal"
        view.backgroundColor = .red
    }
    
    func newTransactionView() {
        self.mainTitle.text = "New Transaction"
        view.backgroundColor = .blue
    }
    
    func newCategoryView() {
        self.mainTitle.text = "New Category"
        view.backgroundColor = .green
    }
    
    
}





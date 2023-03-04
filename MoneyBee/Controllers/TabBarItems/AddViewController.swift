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
    
    @IBOutlet weak var viewStyle: UIView!
    
    let testView: UIView = {
        let view = CategoryContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        typeOfViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//          testView.translatesAutoresizingMaskIntoConstraints = false
//          view.addSubview(testView)
        typeOfViewController()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    
    
}

extension AddViewController: MenuControllerDelegate {
    
    
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
    }
    
    func newTransactionView() {
        self.mainTitle.text = "New Transaction"
    }
    
    func newCategoryView() {
        self.mainTitle.text = "New Category"
        viewStyle.addSubview(testView)
        
    }
    
}






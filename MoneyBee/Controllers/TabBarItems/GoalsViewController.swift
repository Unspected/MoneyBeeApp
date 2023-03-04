//
//  GoalsViewController.swift
//  MoneyBee
//
//  Created by Pavel Andreev on 2/12/23.
//

import UIKit

class GoalsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GoalViewCell.self, forCellWithReuseIdentifier: GoalViewCell.identifer)
        
    }
    

}

extension GoalsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalViewCell.identifer, for: indexPath) as? GoalViewCell else { return UICollectionViewCell() }
        return cell
    }
    
}

extension GoalsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 3, height: collectionView.frame.height / 2.5)
      }
    
    
}

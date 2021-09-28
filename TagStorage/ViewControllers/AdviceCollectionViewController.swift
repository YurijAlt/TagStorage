//
//  AdviceCollectionViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 22.09.2021.
//

import UIKit

//private let reuseIdentifier = "Cell"

class AdviceCollectionViewController: UICollectionViewController {
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdviceCollectionViewCell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.cornerRadius = 20
        return cell
    }
}

//MARK: - Setup UICollectionView
extension AdviceCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 4.8, height: UIScreen.main.bounds.width / 5)
    }
}

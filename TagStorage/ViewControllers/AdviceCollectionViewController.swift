//
//  AdviceCollectionViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 22.09.2021.
//

import UIKit

//private let reuseIdentifier = "Cell"

class AdviceCollectionViewController: UICollectionViewController {
    
    
    
    private let advices = Advice.getAdviceList()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advices.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdviceCollectionViewCell", for: indexPath) as! AdviceCollectionViewCell
        
        let advice = advices[indexPath.row]

        cell.adviceMainLabelText.text = advice.adviceMainLabelText
        cell.advicePreviewImage.image = UIImage(named: advice.imageName)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.cornerRadius = 20
        return cell
    }
    
}

//MARK: - Setup UICollectionView
extension AdviceCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width / 3)
    }
    
}

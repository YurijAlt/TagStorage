//
//  AdviceCollectionViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 22.09.2021.
//

import UIKit

class AdviceCollectionViewController: UICollectionViewController {
    
    //MARK: - Private Properties
    private let advices = Advice.getAdviceList()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     //MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advices.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdviceCollectionViewCell", for: indexPath) as! AdviceCollectionViewCell
        let advice = advices[indexPath.row]
        cell.mainLabelText.text = advice.mainLabelText
        //cell.previewImage.image = UIImage(named: advice.imageName)
        cell.previewImage.image = UIImage(systemName: "checkmark.circle")
        
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "advicesCellBack")!)
        cell.backgroundView = view
        
        return cell
    }

}

//MARK: - Setup UICollectionView
extension AdviceCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: UIScreen.main.bounds.width / 2, height: 150)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 22, bottom: 10, right: 22)
    }
    
    
}

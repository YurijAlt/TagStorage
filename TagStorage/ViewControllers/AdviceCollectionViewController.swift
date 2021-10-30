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
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(named: "selectedCellColor")
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let adviceDetailVC = segue.destination as? AdviceDetailViewController else { return }
        guard let paths = collectionView.indexPathsForSelectedItems else { return }
        guard let indexPath = paths.first?.row else { return }
        adviceDetailVC.advice = advices[indexPath]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
//        //Briefly fade the cell on selection
//        UIView.animate(withDuration: 0.5,
//                       animations: {
//                        //Fade-out
//                        cell?.alpha = 0.5
//        }) { _ in
//            UIView.animate(withDuration: 0.5,
//                           animations: {
//                            //Fade-out
//                            cell?.alpha = 1
//            })
//        }
    }
    
    

}

//MARK: - Setup UICollectionView
extension AdviceCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

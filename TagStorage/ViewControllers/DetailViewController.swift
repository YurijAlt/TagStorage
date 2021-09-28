//
//  DetailViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 19.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Public Properties
    var tag: SavedTag!
    var delegate: MainTableViewControllerDelegate!
    
    //MARK: - IB Outlets
    @IBOutlet weak var tagImage: UIImageView!
    @IBOutlet weak var tagNameLabel: UILabel!
    @IBOutlet weak var tagBrandLabel: UILabel!
    
    @IBOutlet weak var tagStirkaButton: UIButton!
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tagNameLabel.text = tag.name
        tagBrandLabel.text = tag.brand
        tagStirkaButton.isHidden = tag.stirka
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tagImage.layer.cornerRadius = tagImage.frame.width / 2
    }
    
    //MARK: - IBActions
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func deleteButtonTapped() {
        StorageManager.shared.delete(tag)
        delegate.update()
        dismiss(animated: true)
    }
    
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
    @IBAction func tagStirkaInfo() {
        
    }
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
}

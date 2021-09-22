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
    
    //MARK: - IB Outlets
    @IBOutlet weak var tagImage: UIImageView!
    @IBOutlet weak var tagNameLabel: UILabel!
    @IBOutlet weak var tagBrandLabel: UILabel!
    
    
    @IBOutlet weak var tagStirkaLabel: UILabel!
    
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tagNameLabel.text = tag.name
        tagBrandLabel.text = tag.brand
        tagStirkaLabel.isHidden = tag.stirka
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
        dismiss(animated: true)
    }
    
}

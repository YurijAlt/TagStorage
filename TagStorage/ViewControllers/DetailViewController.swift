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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var bleachingButton: UIButton!
    
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
    @IBAction func bleachingInfo() {
        
    }
    
    
    @IBAction func saveButtonTapped() {
        guard let image = tagImage.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
    
    //MARK: - Private Methods
    private func setupUI() {
        if let imageData = tag.img {
            tagImage.image = UIImage(data: imageData)
            tagImage.transform = tagImage.transform.rotated(by: .pi / 2)
        }
        nameLabel.text = tag.name
        brandLabel.text = tag.brand
        bleachingButton.tintColor = tag.stirka ? .systemBlue : .red
        //detail.isHidden = true
        
    }
    
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Ошибка сохранения", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let ac = UIAlertController(title: "Готово!", message: "Изображение сохранено в медиатеку", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
}




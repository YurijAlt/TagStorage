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
    
    @IBOutlet weak var wash30Button: UIButton!
    @IBOutlet weak var wash40Button: UIButton!
    @IBOutlet weak var wash50Button: UIButton!
    @IBOutlet weak var wash60Button: UIButton!
    @IBOutlet weak var handWashButton: UIButton!
    @IBOutlet weak var doNotWashButton: UIButton!
    @IBOutlet weak var bleachingWithChlorineButton: UIButton!
    @IBOutlet weak var nonChlorineBleachButton: UIButton!
    @IBOutlet weak var doNotBleach1Button: UIButton!
    @IBOutlet weak var doNotBleach2Button: UIButton!
    @IBOutlet weak var tumpleDryingLowButton: UIButton!
    @IBOutlet weak var tumpleDryingNormalButton: UIButton!
    @IBOutlet weak var doNotTumpleDryButton: UIButton!
    @IBOutlet weak var lineDryButton: UIButton!
    @IBOutlet weak var dryFlatButton: UIButton!
    @IBOutlet weak var dripDryButton: UIButton!
    @IBOutlet weak var dryInTheShadeButton: UIButton!
    @IBOutlet weak var lineDryInTheShadeButton: UIButton!
    @IBOutlet weak var dryFlatInShadeButton: UIButton!
    @IBOutlet weak var dripDryInShadeButton: UIButton!
    @IBOutlet weak var ironAtLowTempButton: UIButton!
    @IBOutlet weak var ironAtMediumTempButton: UIButton!
    @IBOutlet weak var ironAtHeightTempButton: UIButton!
    @IBOutlet weak var doNotIronButton: UIButton!
    @IBOutlet weak var dryCleanHCSOnlyButton: UIButton!
    @IBOutlet weak var cleaningWithHCSButton: UIButton!
    @IBOutlet weak var gentleCleaningWithHCSButton: UIButton!
    @IBOutlet weak var dryCleanPCEOnlyButton: UIButton!
    @IBOutlet weak var gentleCleaningWithPCEButton: UIButton!
    @IBOutlet weak var veryGentleCleaningWithPCEButton: UIButton!
    @IBOutlet weak var doNotDryCleanButton: UIButton!
    @IBOutlet weak var gentleWetCleaningButton: UIButton!
    @IBOutlet weak var veryGentleWetCleaningButton: UIButton!
    @IBOutlet weak var doNotWetCleanButton: UIButton!
    
    
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
        wash30Button.tintColor = tag.wash30 ? .systemBlue : .red
        
        wash40Button.tintColor = tag.wash40 ? .systemBlue : .red
        wash50Button.tintColor = tag.wash50 ? .systemBlue : .red
        wash60Button.tintColor = tag.wash60 ? .systemBlue : .red
        handWashButton.tintColor = tag.handWash ? .systemBlue : .red
        doNotWashButton.tintColor = tag.doNotWash ? .systemBlue : .red
        bleachingWithChlorineButton.tintColor = tag.bleachingWithChlorine ? .systemBlue : .red
        nonChlorineBleachButton.tintColor = tag.nonChlorineBleach ? .systemBlue : .red
        doNotBleach1Button.tintColor = tag.doNotBleach1 ? .systemBlue : .red
        doNotBleach2Button.tintColor = tag.doNotBleach2 ? .systemBlue : .red
        tumpleDryingLowButton.tintColor = tag.tumpleDryingLow ? .systemBlue : .red
        tumpleDryingNormalButton.tintColor = tag.tumpleDryingNormal ? .systemBlue : .red
        doNotTumpleDryButton.tintColor = tag.doNotTumpleDry ? .systemBlue : .red
        lineDryButton.tintColor = tag.lineDry ? .systemBlue : .red
        dryFlatButton.tintColor = tag.dryFlat ? .systemBlue : .red
        dripDryButton.tintColor = tag.dripDry ? .systemBlue : .red
        dryInTheShadeButton.tintColor = tag.dryInTheShade ? .systemBlue : .red
        lineDryInTheShadeButton.tintColor = tag.lineDryInTheShade ? .systemBlue : .red
        dryFlatInShadeButton.tintColor = tag.dryFlatInShade ? .systemBlue : .red
        dripDryInShadeButton.tintColor = tag.dripDryInShade ? .systemBlue : .red
        ironAtLowTempButton.tintColor = tag.ironAtLowTemp ? .systemBlue : .red
        ironAtMediumTempButton.tintColor = tag.ironAtMediumTemp ? .systemBlue : .red
        ironAtHeightTempButton.tintColor = tag.ironAtHeightTemp ? .systemBlue : .red
        doNotIronButton.tintColor = tag.doNotIron ? .systemBlue : .red
        dryCleanHCSOnlyButton.tintColor = tag.dryCleanHCSOnly ? .systemBlue : .red
        cleaningWithHCSButton.tintColor = tag.cleaningWithHCS ? .systemBlue : .red
        gentleCleaningWithHCSButton.tintColor = tag.gentleCleaningWithHCS ? .systemBlue : .red
        dryCleanPCEOnlyButton.tintColor = tag.dryCleanPCEOnly ? .systemBlue : .red
        gentleCleaningWithPCEButton.tintColor = tag.gentleCleaningWithPCE ? .systemBlue : .red
        veryGentleCleaningWithPCEButton.tintColor = tag.veryGentleCleaningWithPCE ? .systemBlue : .red
        doNotDryCleanButton.tintColor = tag.doNotDryClean ? .systemBlue : .red
        gentleWetCleaningButton.tintColor = tag.gentleWetCleaning ? .systemBlue : .red
        veryGentleWetCleaningButton.tintColor = tag.veryGentleWetCleaning ? .systemBlue : .red
        doNotWetCleanButton.tintColor = tag.doNotWetClean ? .systemBlue : .red
        
        
        
        
        
        
        
        
        
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




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
    
    //MARK: - Private Methods
    private func setupUI() {
        if let imageData = tag.img {
            tagImage.image = UIImage(data: imageData)
        }
        
        tagImage.layer.borderWidth = 1
        tagImage.layer.borderColor = UIColor.white.cgColor
        
        nameLabel.text = tag.name
        brandLabel.text = tag.brand
        
        wash30Button.isEnabled = tag.wash30
        wash40Button.isEnabled = tag.wash40
        wash50Button.isEnabled = tag.wash50
        wash60Button.isEnabled = tag.wash60
        handWashButton.isEnabled = tag.handWash
        doNotWashButton.isEnabled = tag.doNotWash
        
        bleachingWithChlorineButton.isEnabled = tag.bleachingWithChlorine
        nonChlorineBleachButton.isEnabled = tag.nonChlorineBleach
        doNotBleach1Button.isEnabled = tag.doNotBleach1
        doNotBleach2Button.isEnabled = tag.doNotBleach2
        
        tumpleDryingLowButton.isEnabled = tag.tumpleDryingLow
        tumpleDryingNormalButton.isEnabled = tag.tumpleDryingNormal
        doNotTumpleDryButton.isEnabled = tag.doNotTumpleDry
        
        lineDryButton.isEnabled = tag.lineDry
        dryFlatButton.isEnabled = tag.dryFlat
        dripDryButton.isEnabled = tag.dripDry
        dryInTheShadeButton.isEnabled = tag.dryInTheShade
        lineDryInTheShadeButton.isEnabled = tag.lineDryInTheShade
        dryFlatInShadeButton.isEnabled = tag.dryFlatInShade
        dripDryInShadeButton.isEnabled = tag.dripDryInShade
        
        ironAtLowTempButton.isEnabled = tag.ironAtLowTemp
        ironAtMediumTempButton.isEnabled = tag.ironAtMediumTemp
        ironAtHeightTempButton.isEnabled = tag.ironAtHeightTemp
        doNotIronButton.isEnabled = tag.doNotIron
        
        dryCleanHCSOnlyButton.isEnabled = tag.dryCleanHCSOnly
        cleaningWithHCSButton.isEnabled = tag.cleaningWithHCS
        gentleCleaningWithHCSButton.isEnabled = tag.gentleCleaningWithHCS
        dryCleanPCEOnlyButton.isEnabled = tag.dryCleanPCEOnly
        gentleCleaningWithPCEButton.isEnabled = tag.gentleCleaningWithPCE
        veryGentleCleaningWithPCEButton.isEnabled = tag.veryGentleCleaningWithPCE
        doNotDryCleanButton.isEnabled = tag.doNotDryClean
        
        gentleWetCleaningButton.isEnabled = tag.gentleWetCleaning
        veryGentleWetCleaningButton.isEnabled = tag.veryGentleWetCleaning
        doNotWetCleanButton.isEnabled = tag.doNotWetClean
    }
    
}




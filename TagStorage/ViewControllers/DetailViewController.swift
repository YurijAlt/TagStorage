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
    
    @IBAction func symbolOfCareButtonTapped(_ sender: UIButton) {
            showAlert(senderTag: sender.tag)
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
        wash30Button.alpha = tag.wash30 ? 1 : 0.3
        wash40Button.isEnabled = tag.wash40
        wash40Button.alpha = tag.wash40 ? 1 : 0.3
        wash50Button.isEnabled = tag.wash50
        wash50Button.alpha = tag.wash50 ? 1 : 0.3
        wash60Button.isEnabled = tag.wash60
        wash60Button.alpha = tag.wash60 ? 1 : 0.3
        handWashButton.isEnabled = tag.handWash
        handWashButton.alpha = tag.handWash ? 1 : 0.3
        doNotWashButton.isEnabled = tag.doNotWash
        doNotWashButton.alpha = tag.doNotWash ? 1 : 0.3
        
        bleachingWithChlorineButton.isEnabled = tag.bleachingWithChlorine
        bleachingWithChlorineButton.alpha = tag.bleachingWithChlorine ? 1 : 0.3
        nonChlorineBleachButton.isEnabled = tag.nonChlorineBleach
        nonChlorineBleachButton.alpha = tag.nonChlorineBleach ? 1 : 0.3
        doNotBleach1Button.isEnabled = tag.doNotBleach1
        doNotBleach1Button.alpha = tag.doNotBleach1 ? 1 : 0.3
        doNotBleach2Button.isEnabled = tag.doNotBleach2
        doNotBleach2Button.alpha = tag.doNotBleach2 ? 1 : 0.3
        
        tumpleDryingLowButton.isEnabled = tag.tumpleDryingLow
        tumpleDryingLowButton.alpha = tag.tumpleDryingLow ? 1 : 0.3
        tumpleDryingNormalButton.isEnabled = tag.tumpleDryingNormal
        tumpleDryingNormalButton.alpha = tag.tumpleDryingNormal ? 1 : 0.3
        doNotTumpleDryButton.isEnabled = tag.doNotTumpleDry
        doNotTumpleDryButton.alpha = tag.doNotTumpleDry ? 1 : 0.3
        
        lineDryButton.isEnabled = tag.lineDry
        lineDryButton.alpha = tag.lineDry ? 1 : 0.3
        dryFlatButton.isEnabled = tag.dryFlat
        dryFlatButton.alpha = tag.dryFlat ? 1 : 0.3
        dripDryButton.isEnabled = tag.dripDry
        dripDryButton.alpha = tag.dripDry ? 1 : 0.3
        dryInTheShadeButton.isEnabled = tag.dryInTheShade
        dryInTheShadeButton.alpha = tag.dryInTheShade ? 1 : 0.3
        lineDryInTheShadeButton.isEnabled = tag.lineDryInTheShade
        lineDryInTheShadeButton.alpha = tag.lineDryInTheShade ? 1 : 0.3
        dryFlatInShadeButton.isEnabled = tag.dryFlatInShade
        dryFlatInShadeButton.alpha = tag.dryFlatInShade ? 1 : 0.3
        dripDryInShadeButton.isEnabled = tag.dripDryInShade
        dripDryInShadeButton.alpha = tag.dripDryInShade ? 1 : 0.3
        
        ironAtLowTempButton.isEnabled = tag.ironAtLowTemp
        ironAtLowTempButton.alpha = tag.ironAtLowTemp ? 1 : 0.3
        ironAtMediumTempButton.isEnabled = tag.ironAtMediumTemp
        ironAtMediumTempButton.alpha = tag.ironAtMediumTemp ? 1 : 0.3
        ironAtHeightTempButton.isEnabled = tag.ironAtHeightTemp
        ironAtHeightTempButton.alpha = tag.ironAtHeightTemp ? 1 : 0.3
        doNotIronButton.isEnabled = tag.doNotIron
        doNotIronButton.alpha = tag.doNotIron ? 1 : 0.3
        
        dryCleanHCSOnlyButton.isEnabled = tag.dryCleanHCSOnly
        dryCleanHCSOnlyButton.alpha = tag.dryCleanHCSOnly ? 1 : 0.3
        cleaningWithHCSButton.isEnabled = tag.cleaningWithHCS
        cleaningWithHCSButton.alpha = tag.cleaningWithHCS ? 1 : 0.3
        gentleCleaningWithHCSButton.isEnabled = tag.gentleCleaningWithHCS
        gentleCleaningWithHCSButton.alpha = tag.gentleCleaningWithHCS ? 1 : 0.3
        dryCleanPCEOnlyButton.isEnabled = tag.dryCleanPCEOnly
        dryCleanPCEOnlyButton.alpha = tag.dryCleanPCEOnly ? 1 : 0.3
        gentleCleaningWithPCEButton.isEnabled = tag.gentleCleaningWithPCE
        gentleCleaningWithPCEButton.alpha = tag.gentleCleaningWithPCE ? 1 : 0.3
        veryGentleCleaningWithPCEButton.isEnabled = tag.veryGentleCleaningWithPCE
        veryGentleCleaningWithPCEButton.alpha = tag.veryGentleCleaningWithPCE ? 1 : 0.3
        doNotDryCleanButton.isEnabled = tag.doNotDryClean
        doNotDryCleanButton.alpha = tag.doNotDryClean ? 1 : 0.3
        
        gentleWetCleaningButton.isEnabled = tag.gentleWetCleaning
        gentleWetCleaningButton.alpha = tag.gentleWetCleaning ? 1 : 0.3
        veryGentleWetCleaningButton.isEnabled = tag.veryGentleWetCleaning
        veryGentleWetCleaningButton.alpha = tag.veryGentleWetCleaning ? 1 : 0.3
        doNotWetCleanButton.isEnabled = tag.doNotWetClean
        doNotWetCleanButton.alpha = tag.doNotWetClean ? 1 : 0.3
    }
    
    private func showAlert(senderTag: Int) {
        let alert = UIAlertController(title: "", message: DataManager.shared.careDescriptions[senderTag - 1], preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alert.dismiss(animated: true)
        }
    }
    
}




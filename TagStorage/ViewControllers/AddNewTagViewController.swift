//
//  ViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 19.09.2021.
//

import UIKit

class AddNewTagViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tagNameTextField: UITextField!
    @IBOutlet weak var tagBrandTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageFromCam: UIImageView!
    
    //MARK: - Public Properties
    var delegate: MainTableViewControllerDelegate!
    
    //MARK: - Private Properties
    private var wash30 = false
    private var wash40 = false
    private var wash50 = false
    private var wash60 = false
    private var handWash = false
    private var doNotWash = false
    
    private var bleachingWithChlorine = false
    private var nonChlorineBleach = false
    private var doNotBleach1 = false
    private var doNotBleach2 = false
    
    private var tumpleDryingLow = false
    private var tumpleDryingNormal = false
    private var doNotTumpleDry = false
    
    private var lineDry = false
    private var dryFlat = false
    private var dripDry = false
    private var dryInTheShade = false
    private var lineDryInTheShade = false
    private var dryFlatInShade = false
    private var dripDryInShade = false
    
    private var ironAtLowTemp = false
    private var ironAtMediumTemp = false
    private var ironAtHeightTemp = false
    private var doNotIron = false
    
    private var dryCleanHCSOnly = false
    private var cleaningWithHCS = false
    private var gentleCleaningWithHCS = false
    private var dryCleanPCEOnly = false
    private var gentleCleaningWithPCE = false
    private var veryGentleCleaningWithPCE = false
    private var doNotDryClean = false
    
    private var gentleWetCleaning = false
    private var veryGentleWetCleaning = false
    private var doNotWetClean = false
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageFromCam.layer.borderWidth = 1
        imageFromCam.layer.borderColor = UIColor.white.cgColor
    }
    
    //MARK: - IBActions
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonTapped() {
        saveTag()
        delegate.update()
    }
    
    @IBAction func wash30ButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            changeAlpha(from: wash30, to: sender)
            wash30.toggle()
        } else if sender.tag == 2 {
            changeAlpha(from: wash40, to: sender)
            wash40.toggle()
        } else if sender.tag == 3 {
            changeAlpha(from: wash50, to: sender)
            wash50.toggle()
        } else if sender.tag == 4 {
            changeAlpha(from: wash60, to: sender)
            wash60.toggle()
        } else if sender.tag == 5 {
            changeAlpha(from: handWash, to: sender)
            handWash.toggle()
        } else if sender.tag == 6 {
            changeAlpha(from: doNotWash, to: sender)
            doNotWash.toggle()
        } else if sender.tag == 7 {
            changeAlpha(from: bleachingWithChlorine, to: sender)
            bleachingWithChlorine.toggle()
        } else if sender.tag == 8 {
            changeAlpha(from: nonChlorineBleach, to: sender)
            nonChlorineBleach.toggle()
        } else if sender.tag == 9 {
            changeAlpha(from: doNotBleach1, to: sender)
            doNotBleach1.toggle()
        } else if sender.tag == 10 {
            changeAlpha(from: doNotBleach2, to: sender)
            doNotBleach2.toggle()
        } else if sender.tag == 11 {
            changeAlpha(from: tumpleDryingLow, to: sender)
            tumpleDryingLow.toggle()
        } else if sender.tag == 12 {
            changeAlpha(from: tumpleDryingNormal, to: sender)
            tumpleDryingNormal.toggle()
        } else if sender.tag == 13 {
            changeAlpha(from: doNotTumpleDry, to: sender)
            doNotTumpleDry.toggle()
        } else if sender.tag == 14 {
            changeAlpha(from: lineDry, to: sender)
            lineDry.toggle()
        } else if sender.tag == 15 {
            changeAlpha(from: dryFlat, to: sender)
            dryFlat.toggle()
        } else if sender.tag == 16 {
            changeAlpha(from: dripDry, to: sender)
            dripDry.toggle()
        } else if sender.tag == 17 {
            changeAlpha(from: dryInTheShade, to: sender)
            dryInTheShade.toggle()
        } else if sender.tag == 18 {
            changeAlpha(from: lineDryInTheShade, to: sender)
            lineDryInTheShade.toggle()
        } else if sender.tag == 19 {
            changeAlpha(from: dryFlatInShade, to: sender)
            dryFlatInShade.toggle()
        } else if sender.tag == 20 {
            changeAlpha(from: dripDryInShade, to: sender)
            dripDryInShade.toggle()
        } else if sender.tag == 21 {
            changeAlpha(from: ironAtLowTemp, to: sender)
            ironAtLowTemp.toggle()
        } else if sender.tag == 22 {
            changeAlpha(from: ironAtMediumTemp, to: sender)
            ironAtMediumTemp.toggle()
        } else if sender.tag == 23 {
            changeAlpha(from: ironAtHeightTemp, to: sender)
            ironAtHeightTemp.toggle()
        } else if sender.tag == 24 {
            changeAlpha(from: doNotIron, to: sender)
            doNotIron.toggle()
        } else if sender.tag == 25 {
            changeAlpha(from: dryCleanHCSOnly, to: sender)
            dryCleanHCSOnly.toggle()
        } else if sender.tag == 26 {
            changeAlpha(from: cleaningWithHCS, to: sender)
            cleaningWithHCS.toggle()
        } else if sender.tag == 27 {
            changeAlpha(from: gentleCleaningWithHCS, to: sender)
            gentleCleaningWithHCS.toggle()
        } else if sender.tag == 28 {
            changeAlpha(from: dryCleanPCEOnly, to: sender)
            dryCleanPCEOnly.toggle()
        } else if sender.tag == 29 {
            changeAlpha(from: gentleCleaningWithPCE, to: sender)
            gentleCleaningWithPCE.toggle()
        } else if sender.tag == 30 {
            changeAlpha(from: veryGentleCleaningWithPCE, to: sender)
            veryGentleCleaningWithPCE.toggle()
        } else if sender.tag == 31 {
            changeAlpha(from: doNotDryClean, to: sender)
            doNotDryClean.toggle()
        } else if sender.tag == 32 {
            changeAlpha(from: gentleWetCleaning, to: sender)
            gentleWetCleaning.toggle()
        } else if sender.tag == 33 {
            changeAlpha(from: veryGentleWetCleaning, to: sender)
            veryGentleWetCleaning.toggle()
        } else if sender.tag == 34 {
            changeAlpha(from: doNotWetClean, to: sender)
            doNotWetClean.toggle()
        }
    }
    
    
    
    
    
    @IBAction func takeFromCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    //MARK: - Private Methods
    private func saveTag() {
        if tagNameTextField.text != "" {
            if let imgData = imageFromCam.image?.jpegData(compressionQuality: 1.0) {
                StorageManager.shared.save(
                    Tag(
                        img: imgData,
                        name: tagNameTextField.text ?? "",
                        brand: tagBrandTextField.text ?? "",
                        dateStamp: Date(),
                        wash30: wash30,
                        wash40: wash40,
                        wash50: wash50,
                        wash60: wash60,
                        handWash: handWash,
                        doNotWash: doNotWash,
                        bleachingWithChlorine: bleachingWithChlorine,
                        nonChlorineBleach: nonChlorineBleach,
                        doNotBleach1: doNotBleach1,
                        doNotBleach2: doNotBleach2,
                        tumpleDryingLow: tumpleDryingLow,
                        tumpleDryingNormal: tumpleDryingNormal,
                        doNotTumpleDry: doNotTumpleDry,
                        lineDry: lineDry,
                        dryFlat: dryFlat,
                        dripDry: dripDry,
                        dryInTheShade: dryInTheShade,
                        lineDryInTheShade: lineDryInTheShade,
                        dryFlatInShade: dryFlatInShade,
                        dripDryInShade: dripDryInShade,
                        ironAtLowTemp: ironAtLowTemp,
                        ironAtMediumTemp: ironAtMediumTemp,
                        ironAtHeightTemp: ironAtHeightTemp,
                        doNotIron: doNotIron,
                        dryCleanHCSOnly: dryCleanHCSOnly,
                        cleaningWithHCS: cleaningWithHCS,
                        gentleCleaningWithHCS: gentleCleaningWithHCS,
                        dryCleanPCEOnly: dryCleanPCEOnly,
                        gentleCleaningWithPCE: gentleCleaningWithPCE,
                        veryGentleCleaningWithPCE: veryGentleCleaningWithPCE,
                        doNotDryClean: doNotDryClean,
                        gentleWetCleaning: gentleWetCleaning,
                        veryGentleWetCleaning: veryGentleWetCleaning,
                        doNotWetClean: doNotWetClean
                    )
                )
            }
            dismiss(animated: true, completion: nil)
        }
        else {
            tagNameTextField.becomeFirstResponder()
            tagNameTextField.backgroundColor = UIColor.systemGray4
            }
        }
    
    
    private func changeTintColor(from value: Bool, to sender: UIButton) {
        if value {
            sender.tintColor = .red
        } else {
            sender.tintColor = .none
        }
    }
    
    private func changeAlpha(from value: Bool, to sender: UIButton) {
        if value {
            sender.alpha = 0.2
        } else { sender.alpha = 1.0
        }
    }
    
    private func changeEnableStatus(from value: Bool, to sender: UIButton) {
        if !value {
            sender.isEnabled = true
        } else { sender.isEnabled = false
        }
    }
    
}

//MARK: - Work with keyboard
extension AddNewTagViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tagNameTextField {
            tagBrandTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}

//MARK: - Work with camera
extension AddNewTagViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageFromCam.image = image
    }
}

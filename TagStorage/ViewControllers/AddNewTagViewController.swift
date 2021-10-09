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
    private var wash30 = true
    private var wash40 = true
    private var wash50 = true
    private var wash60 = true
    private var handWash = true
    private var doNotWash = true
    
    private var bleachingWithChlorine = true
    private var nonChlorineBleach = true
    private var doNotBleach1 = true
    private var doNotBleach2 = true
    
    private var tumpleDryingLow = true
    private var tumpleDryingNormal = true
    private var doNotTumpleDry = true
    
    private var lineDry = true
    private var dryFlat = true
    private var dripDry = true
    private var dryInTheShade = true
    private var lineDryInTheShade = true
    private var dryFlatInShade = true
    private var dripDryInShade = true
    
    private var ironAtLowTemp = true
    private var ironAtMediumTemp = true
    private var ironAtHeightTemp = true
    private var doNotIron = true
    
    private var dryCleanHCSOnly = true
    private var cleaningWithHCS = true
    private var gentleCleaningWithHCS = true
    private var dryCleanPCEOnly = true
    private var gentleCleaningWithPCE = true
    private var veryGentleCleaningWithPCE = true
    private var doNotDryClean = true
    
    private var gentleWetCleaning = true
    private var veryGentleWetCleaning = true
    private var doNotWetClean = true
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFromCam.image = UIImage(named: "tshort")
    }
    
    //MARK: - IBActions
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonTapped() {
        saveTag()
        delegate.update()
        dismiss(animated: true)
    }
    
    @IBAction func wash30ButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            changeTintColor(from: wash30, to: sender)
            wash30.toggle()
        } else if sender.tag == 2 {
            changeTintColor(from: wash40, to: sender)
            wash40.toggle()
        } else if sender.tag == 3 {
            changeTintColor(from: wash50, to: sender)
            wash50.toggle()
        } else if sender.tag == 4 {
            changeTintColor(from: wash60, to: sender)
            wash60.toggle()
        } else if sender.tag == 5 {
            changeTintColor(from: handWash, to: sender)
            handWash.toggle()
        } else if sender.tag == 6 {
            changeTintColor(from: doNotWash, to: sender)
            doNotWash.toggle()
        } else if sender.tag == 7 {
            changeTintColor(from: bleachingWithChlorine, to: sender)
            bleachingWithChlorine.toggle()
        } else if sender.tag == 8 {
            changeTintColor(from: nonChlorineBleach, to: sender)
            nonChlorineBleach.toggle()
        } else if sender.tag == 9 {
            changeTintColor(from: doNotBleach1, to: sender)
            doNotBleach1.toggle()
        } else if sender.tag == 10 {
            changeTintColor(from: doNotBleach2, to: sender)
            doNotBleach2.toggle()
        } else if sender.tag == 11 {
            changeTintColor(from: tumpleDryingLow, to: sender)
            tumpleDryingLow.toggle()
        } else if sender.tag == 12 {
            changeTintColor(from: tumpleDryingNormal, to: sender)
            tumpleDryingNormal.toggle()
        } else if sender.tag == 13 {
            changeTintColor(from: doNotTumpleDry, to: sender)
            doNotTumpleDry.toggle()
        } else if sender.tag == 14 {
            changeTintColor(from: lineDry, to: sender)
            lineDry.toggle()
        } else if sender.tag == 15 {
            changeTintColor(from: dryFlat, to: sender)
            dryFlat.toggle()
        } else if sender.tag == 16 {
            changeTintColor(from: dripDry, to: sender)
            dripDry.toggle()
        } else if sender.tag == 17 {
            changeTintColor(from: dryInTheShade, to: sender)
            dryInTheShade.toggle()
        } else if sender.tag == 18 {
            changeTintColor(from: lineDryInTheShade, to: sender)
            lineDryInTheShade.toggle()
        } else if sender.tag == 19 {
            changeTintColor(from: dryFlatInShade, to: sender)
            dryFlatInShade.toggle()
        } else if sender.tag == 20 {
            changeTintColor(from: dripDryInShade, to: sender)
            dripDryInShade.toggle()
        } else if sender.tag == 21 {
            changeTintColor(from: ironAtLowTemp, to: sender)
            ironAtLowTemp.toggle()
        } else if sender.tag == 22 {
            changeTintColor(from: ironAtMediumTemp, to: sender)
            ironAtMediumTemp.toggle()
        } else if sender.tag == 23 {
            changeTintColor(from: ironAtHeightTemp, to: sender)
            ironAtHeightTemp.toggle()
        } else if sender.tag == 24 {
            changeTintColor(from: doNotIron, to: sender)
            doNotIron.toggle()
        } else if sender.tag == 25 {
            changeTintColor(from: dryCleanHCSOnly, to: sender)
            dryCleanHCSOnly.toggle()
        } else if sender.tag == 26 {
            changeTintColor(from: cleaningWithHCS, to: sender)
            cleaningWithHCS.toggle()
        } else if sender.tag == 27 {
            changeTintColor(from: gentleCleaningWithHCS, to: sender)
            gentleCleaningWithHCS.toggle()
        } else if sender.tag == 28 {
            changeTintColor(from: dryCleanPCEOnly, to: sender)
            dryCleanPCEOnly.toggle()
        } else if sender.tag == 29 {
            changeTintColor(from: gentleCleaningWithPCE, to: sender)
            gentleCleaningWithPCE.toggle()
        } else if sender.tag == 30 {
            changeTintColor(from: veryGentleCleaningWithPCE, to: sender)
            veryGentleCleaningWithPCE.toggle()
        } else if sender.tag == 31 {
            changeTintColor(from: doNotDryClean, to: sender)
            doNotDryClean.toggle()
        } else if sender.tag == 32 {
            changeTintColor(from: gentleWetCleaning, to: sender)
            gentleWetCleaning.toggle()
        } else if sender.tag == 33 {
            changeTintColor(from: veryGentleWetCleaning, to: sender)
            veryGentleWetCleaning.toggle()
        } else if sender.tag == 34 {
            changeTintColor(from: doNotWetClean, to: sender)
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
        }
    }
    
    private func changeTintColor(from value: Bool, to sender: UIButton) {
        if value {
            sender.tintColor = .red
        } else {
            sender.tintColor = .none
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

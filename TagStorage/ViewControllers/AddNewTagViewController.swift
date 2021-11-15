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
    
    @IBAction func symbolOfCareButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            changeAlpha(from: wash30, to: sender)
            wash30.toggle()
        case 2:
            changeAlpha(from: wash40, to: sender)
            wash40.toggle()
        case 3:
            changeAlpha(from: wash50, to: sender)
            wash50.toggle()
        case 4:
            changeAlpha(from: wash60, to: sender)
            wash60.toggle()
        case 5:
            changeAlpha(from: handWash, to: sender)
            handWash.toggle()
        case 6:
            changeAlpha(from: doNotWash, to: sender)
            doNotWash.toggle()
        case 7:
            changeAlpha(from: bleachingWithChlorine, to: sender)
            bleachingWithChlorine.toggle()
        case 8:
            changeAlpha(from: nonChlorineBleach, to: sender)
            nonChlorineBleach.toggle()
        case 9:
            changeAlpha(from: doNotBleach1, to: sender)
            doNotBleach1.toggle()
        case 10:
            changeAlpha(from: doNotBleach2, to: sender)
            doNotBleach2.toggle()
        case 11:
            changeAlpha(from: tumpleDryingLow, to: sender)
            tumpleDryingLow.toggle()
        case 12:
            changeAlpha(from: tumpleDryingNormal, to: sender)
            tumpleDryingNormal.toggle()
        case 13:
            changeAlpha(from: doNotTumpleDry, to: sender)
            doNotTumpleDry.toggle()
        case 14:
            changeAlpha(from: lineDry, to: sender)
            lineDry.toggle()
        case 15:
            changeAlpha(from: dryFlat, to: sender)
            dryFlat.toggle()
        case 16:
            changeAlpha(from: dripDry, to: sender)
            dripDry.toggle()
        case 17:
            changeAlpha(from: dryInTheShade, to: sender)
            dryInTheShade.toggle()
        case 18:
            changeAlpha(from: lineDryInTheShade, to: sender)
            lineDryInTheShade.toggle()
        case 19:
            changeAlpha(from: dryFlatInShade, to: sender)
            dryFlatInShade.toggle()
        case 20:
            changeAlpha(from: dripDryInShade, to: sender)
            dripDryInShade.toggle()
        case 21:
            changeAlpha(from: ironAtLowTemp, to: sender)
            ironAtLowTemp.toggle()
        case 22:
            changeAlpha(from: ironAtMediumTemp, to: sender)
            ironAtMediumTemp.toggle()
        case 23:
            changeAlpha(from: ironAtHeightTemp, to: sender)
            ironAtHeightTemp.toggle()
        case 24:
            changeAlpha(from: doNotIron, to: sender)
            doNotIron.toggle()
        case 25:
            changeAlpha(from: dryCleanHCSOnly, to: sender)
            dryCleanHCSOnly.toggle()
        case 26:
            changeAlpha(from: cleaningWithHCS, to: sender)
            cleaningWithHCS.toggle()
        case 27:
            changeAlpha(from: gentleCleaningWithHCS, to: sender)
            gentleCleaningWithHCS.toggle()
        case 28:
            changeAlpha(from: dryCleanPCEOnly, to: sender)
            dryCleanPCEOnly.toggle()
        case 29:
            changeAlpha(from: gentleCleaningWithPCE, to: sender)
            gentleCleaningWithPCE.toggle()
        case 30:
            changeAlpha(from: veryGentleCleaningWithPCE, to: sender)
            veryGentleCleaningWithPCE.toggle()
        case 31:
            changeAlpha(from: doNotDryClean, to: sender)
            doNotDryClean.toggle()
        case 32:
            changeAlpha(from: gentleWetCleaning, to: sender)
            gentleWetCleaning.toggle()
        case 33:
            changeAlpha(from: veryGentleWetCleaning, to: sender)
            veryGentleWetCleaning.toggle()
        default:
            changeAlpha(from: doNotWetClean, to: sender)
            doNotWetClean.toggle()
        }
    }
    
    
    @IBAction func takePhotoFromCamera() {
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
                    imgData,
                    tagNameTextField.text ?? "",
                    tagBrandTextField.text ?? "",
                    Date(),
                    wash30,
                    wash40,
                    wash50,
                    wash60,
                    handWash,
                    doNotWash,
                    bleachingWithChlorine,
                    nonChlorineBleach,
                    doNotBleach1,
                    doNotBleach2,
                    tumpleDryingLow,
                    tumpleDryingNormal,
                    doNotTumpleDry,
                    lineDry,
                    dryFlat,
                    dripDry,
                    dryInTheShade,
                    lineDryInTheShade,
                    dryFlatInShade,
                    dripDryInShade,
                    ironAtLowTemp,
                    ironAtMediumTemp,
                    ironAtHeightTemp,
                    doNotIron,
                    dryCleanHCSOnly,
                    cleaningWithHCS,
                    gentleCleaningWithHCS,
                    dryCleanPCEOnly,
                    gentleCleaningWithPCE,
                    veryGentleCleaningWithPCE,
                    doNotDryClean,
                    gentleWetCleaning,
                    veryGentleWetCleaning,
                    doNotWetClean
                )
            }
            dismiss(animated: true, completion: nil)
        }
        else {
            tagNameTextField.becomeFirstResponder()
            tagNameTextField.backgroundColor = UIColor.systemGray4
        }
    }
    
    private func changeAlpha(from value: Bool, to sender: UIButton) {
        sender.alpha = value ? 0.2 : 1.0
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

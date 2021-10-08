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
    
    private var dateStamp = Date()
    
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
        changeTintColor(from: wash30, to: sender)
        wash30.toggle()
    }
    
    @IBAction func wash40ButtonTapped(_ sender: UIButton) {
        changeTintColor(from: wash40, to: sender)
        wash40.toggle()
    }
    
    @IBAction func wash50ButtonTapped(_ sender: UIButton) {
        changeTintColor(from: wash50, to: sender)
        wash50.toggle()
    }
    @IBAction func wash60ButtonTapped(_ sender: UIButton) {
        changeTintColor(from: wash60, to: sender)
        wash60.toggle()
    }
    @IBAction func handWashButtonTapped(_ sender: UIButton) {
        changeTintColor(from: handWash, to: sender)
        handWash.toggle()
    }
    @IBAction func doNotWashButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotWash, to: sender)
        doNotWash.toggle()
    }
    @IBAction func bleachingWithChlorineButtonTapped(_ sender: UIButton) {
        changeTintColor(from: bleachingWithChlorine, to: sender)
        bleachingWithChlorine.toggle()
    }
    @IBAction func nonChlorineBleachButtonTapped(_ sender: UIButton) {
        changeTintColor(from: nonChlorineBleach, to: sender)
        nonChlorineBleach.toggle()
    }
    @IBAction func doNotBleach1ButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotBleach1, to: sender)
        doNotBleach1.toggle()
    }
    @IBAction func doNotBleach2ButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotBleach2, to: sender)
        doNotBleach2.toggle()
    }
    @IBAction func tumpleDryingLowButtonTapped(_ sender: UIButton) {
        changeTintColor(from: tumpleDryingLow, to: sender)
        tumpleDryingLow.toggle()
    }
    @IBAction func tumpleDryingNormalButtonTapped(_ sender: UIButton) {
        changeTintColor(from: tumpleDryingNormal, to: sender)
        tumpleDryingNormal.toggle()
    }
    @IBAction func doNotTumpleDryButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotTumpleDry, to: sender)
        doNotTumpleDry.toggle()
    }
    @IBAction func lineDryButtonTapped(_ sender: UIButton) {
        changeTintColor(from: lineDry, to: sender)
        lineDry.toggle()
    }
    @IBAction func dryFlatButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dryFlat, to: sender)
        dryFlat.toggle()
    }
    @IBAction func dripDryButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dripDry, to: sender)
        dripDry.toggle()
    }
    @IBAction func dryInTheShadeButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dryInTheShade, to: sender)
        dryInTheShade.toggle()
    }
    @IBAction func lineDryInTheShadeButtonTapped(_ sender: UIButton) {
        changeTintColor(from: lineDryInTheShade, to: sender)
        lineDryInTheShade.toggle()
    }
    @IBAction func dryFlatInShadeButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dryFlatInShade, to: sender)
        dryFlatInShade.toggle()
    }
    @IBAction func dripDryInShadeButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dryInTheShade, to: sender)
        dripDryInShade.toggle()
    }
    @IBAction func ironAtLowTempButtonTapped(_ sender: UIButton) {
        changeTintColor(from: ironAtLowTemp, to: sender)
        ironAtLowTemp.toggle()
    }
    @IBAction func ironAtMediumTempButtonTapped(_ sender: UIButton) {
        changeTintColor(from: ironAtMediumTemp, to: sender)
        ironAtMediumTemp.toggle()
    }
    @IBAction func ironAtHeightTempButtonTapped(_ sender: UIButton) {
        changeTintColor(from: ironAtHeightTemp, to: sender)
        ironAtHeightTemp.toggle()
    }
    @IBAction func doNotIronButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotIron, to: sender)
        doNotIron.toggle()
    }
    @IBAction func dryCleanHCSOnlyButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dryCleanHCSOnly, to: sender)
        dryCleanHCSOnly.toggle()
    }
    @IBAction func cleaningWithHCSButtonTapped(_ sender: UIButton) {
        changeTintColor(from: cleaningWithHCS, to: sender)
        cleaningWithHCS.toggle()
    }
    @IBAction func gentleCleaningWithHCSButtonTapped(_ sender: UIButton) {
        changeTintColor(from: gentleCleaningWithHCS, to: sender)
        gentleCleaningWithHCS.toggle()
    }
    @IBAction func dryCleanPCEOnlyButtonTapped(_ sender: UIButton) {
        changeTintColor(from: dryCleanPCEOnly, to: sender)
        dryCleanPCEOnly.toggle()
    }
    @IBAction func gentleCleaningWithPCEButtonTapped(_ sender: UIButton) {
        changeTintColor(from: gentleCleaningWithPCE, to: sender)
        gentleCleaningWithPCE.toggle()
    }
    @IBAction func veryGentleCleaningWithPCEButtonTapped(_ sender: UIButton) {
        changeTintColor(from: veryGentleCleaningWithPCE, to: sender)
        veryGentleCleaningWithPCE.toggle()
    }
    @IBAction func doNotDryCleanButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotDryClean, to: sender)
        doNotDryClean.toggle()
    }
    @IBAction func gentleWetCleaningButtonTapped(_ sender: UIButton) {
        changeTintColor(from: gentleWetCleaning, to: sender)
        gentleWetCleaning.toggle()
    }
    @IBAction func veryGentleWetCleaningButtonTapped(_ sender: UIButton) {
        changeTintColor(from: veryGentleWetCleaning, to: sender)
        veryGentleWetCleaning.toggle()
    }
    @IBAction func doNotWetCleanButtonTapped(_ sender: UIButton) {
        changeTintColor(from: doNotWetClean, to: sender)
        doNotWetClean.toggle()
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
            if let imageData = imageFromCam.image?.pngData() {
                StorageManager.shared.save(
                    Tag(
                        img: imageData,
                        name: tagNameTextField.text ?? "",
                        brand: tagBrandTextField.text ?? "",
                        dateStamp: dateStamp,
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

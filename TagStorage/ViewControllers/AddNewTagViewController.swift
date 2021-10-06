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
    
    @IBAction func tagButton(_ sender: UIButton) {
        if wash30 { sender.tintColor = .red
        } else {
            sender.tintColor = .none
        }
        wash30.toggle()
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
                StorageManager.shared.save(Tag(
                    img: imageData, name: tagNameTextField.text ?? "",
                    brand: tagBrandTextField.text ?? "",
                    tagStirka: wash30
                ))
            }
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

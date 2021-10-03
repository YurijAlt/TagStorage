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
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
    private var firstTagIsEnabled = true
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFromCam.image = UIImage(named: "tshort")
        //addButton.isHidden = true
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
        if firstTagIsEnabled { sender.tintColor = .red
        } else {
            sender.tintColor = .none
        }
        firstTagIsEnabled.toggle()
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
            
            //MARK: - Создаем объект типа Data из изображения UIImageView.
            
            if let imageData = self.imageFromCam.image?.pngData() {
                
                StorageManager.shared.save(Tag(
                    img: imageData, name: tagNameTextField.text ?? "",
                    brand: tagBrandTextField.text ?? "",
                    tagStirka: firstTagIsEnabled
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
    
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //        if tagNameTextField.text != "" {
    //            addButton.isHidden = false
    //            addButton.increase()
    //        } else {
    //            addButton.isHidden = true
    //        }
    //    }
    
    
}


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

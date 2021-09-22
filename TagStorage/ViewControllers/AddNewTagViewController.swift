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
    
    
    
    //MARK: - !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    private var firstTagIsEnabled = true

    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
     //   addButton.isHidden = true
    }
    

    
    //MARK: - IBActions
    @IBAction func deleteButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonTapped() {
        saveTag()
        dismiss(animated: true)
    }

    
    @IBAction func tagButton(_ sender: UIButton) {
        if firstTagIsEnabled { sender.tintColor = .red
        } else {
            sender.tintColor = .none
        }
        firstTagIsEnabled.toggle()
    }
    
    //MARK: - ?????????????????????????????????????????????????????????
    
    
    
    //MARK: - Private Methods
    private func saveTag() {
        if tagNameTextField.text != "" && tagBrandTextField.text != "" {
            StorageManager.shared.save(Tag(
                                        tagName: tagNameTextField.text ?? "",
                                        tagBrand: tagBrandTextField.text ?? "",
                                        tagStirka: firstTagIsEnabled
            ))
        }
    }
    
}

//MARK: - Work with keyboard
extension AddNewTagViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

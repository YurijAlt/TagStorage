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
    //MARK: - Public Properties
    var delegate: MainTableViewControllerDelegate!
    
    //MARK: - Private Properties
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
    private var firstTagIsEnabled = true
    //MARK: - TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST! TEST!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    //MARK: - Private Methods
    private func saveTag() {
        if tagNameTextField.text != "" {
            StorageManager.shared.save(Tag(
                name: tagNameTextField.text ?? "",
                brand: tagBrandTextField.text ?? "",
                tagStirka: firstTagIsEnabled
            ))
        }
        else {
            let alert = UIAlertController(title: "Ошибка", message: "Ввете название вещи", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
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

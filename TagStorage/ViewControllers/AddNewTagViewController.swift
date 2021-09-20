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
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
    
    //MARK: - Private Methods
    private func saveTag() {
        if tagNameTextField.text != "" && tagBrandTextField.text != "" {
            StorageManager.shared.save(Tag(tagName: tagNameTextField.text ?? "", tagBrand: tagBrandTextField.text ?? ""))
        }
    }
    
}


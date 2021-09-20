//
//  ViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 19.09.2021.
//

import UIKit

class AddNewTagViewController: UIViewController {

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
}


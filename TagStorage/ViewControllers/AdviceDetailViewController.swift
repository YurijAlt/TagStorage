//
//  AdviceDetailViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 02.10.2021.
//

import UIKit

class AdviceDetailViewController: UIViewController {
    
    //MARK: - Private Properties
    var advice: Advice!
    
    //MARK: - IB Outlets
    @IBOutlet weak var adviceLabel: UILabel!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adviceLabel.text = advice.detailLabelText
        
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
            presentationController.prefersGrabberVisible = true
        }
    }
    
    //MARK: - IB Actions
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }

}

//
//  AboutViewController.swift
//  TagStorage
//
//  Created by Юрий Альт on 31.10.2021.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var mainTextLabel: UILabel!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTextLabel.attributedText = NSMutableAttributedString()
                .normal("👋 Hi, I'm Yurij Chekalyuk.")
                .bold("\n\n💫I am very glad that my dream ")
                .normal("has come true to see how the iPhone application I created will help people all over the world.\n\n🙇 Thanks for using this app. And ")
                .bold("thanks ")
                .normal("to everyone who recommends this application to their family and friends.\n\n")
    }
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}



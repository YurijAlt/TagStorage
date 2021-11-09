//
//  Start4ViewController.swift
//  YourTags
//
//  Created by Юрий Альт on 08.11.2021.
//

import UIKit

class Start4ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var startButton: UIButton!
    //MARK: - IBActions
    @IBAction func startButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "start", sender: nil)
    }
}

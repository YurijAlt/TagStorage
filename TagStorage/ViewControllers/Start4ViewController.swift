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
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "start4")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        
        setupImageView()
    }
    
    private func setupImageView() {
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 224).isActive = true
    }
    
}

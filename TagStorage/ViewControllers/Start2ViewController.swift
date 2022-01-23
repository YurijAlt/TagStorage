//
//  Start2ViewController.swift
//  YourTags
//
//  Created by Юрий Альт on 08.11.2021.
//

import UIKit

class Start2ViewController: UIViewController {

    private let imageView: UIImageView = {
        let image = UIImage(named: "start2")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textColor = UIColor(cgColor: CGColor(red: 88/255, green: 74/255, blue: 126/255, alpha: 1))
        label.text = "Keep all your tags always at hand in your iPhone"
        label.textAlignment = .center
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        setupImageView()
        setupLabel()
    }
    
    
    private func setupImageView() {
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 224).isActive = true
    }
    
    private func setupLabel() {
        label.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
    }
}

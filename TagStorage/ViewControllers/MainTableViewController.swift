//
//  MainTableViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 19.09.2021.
//

import UIKit

protocol MainTableViewControllerDelegate {
    func update()
}

class MainTableViewController: UITableViewController {
    
    //MARK: - Private Properties
    private var tags: [SavedTag] = []
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.reloadData()
        changeTabBarBadgeValue()
        let image = UIImage(named: "back")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewTagViewController" {
            guard let addNewTagVC = segue.destination as? AddNewTagViewController else { return }
            addNewTagVC.delegate = self
        }
        if segue.identifier == "DetailViewController" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.tag = tags[indexPath.row]
            detailVC.delegate = self
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let tag = tags[indexPath.row]
        
        if let imageData = tag.img {
            cell.tagImage.image = UIImage(data: imageData)
        }
        cell.tagNameLabel.text = tag.name
        cell.TagBrandLabel.text = tag.brand
        
        if let dateData = tag.dateStamp {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
            cell.dateLabel.text = dateFormatter.string(from: dateData)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    //MARK: - IB Actions
    @IBAction func sortingList(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            StorageManager.shared.fetchbyDate { result in
                switch result {
                case .success(let tags):
                    self.tags = tags
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
            tableView.reloadData()
    }
        
        if sender.selectedSegmentIndex == 1 {
            StorageManager.shared.fetchbyAZ { result in
                switch result {
                case .success(let tags):
                    self.tags = tags
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
            tableView.reloadData()
    }
    }
    
    //MARK: - Private Methods
    private func fetchData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let tags):
                self.tags = tags
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func changeTabBarBadgeValue() {
        if !tags.isEmpty {
            navigationController?.tabBarController?.tabBar.items![0].badgeColor = #colorLiteral(red: 0.5076813102, green: 0.403300941, blue: 0.7961540818, alpha: 1)
            navigationController?.tabBarController?.tabBar.items![0].badgeValue = "\(tags.count)🏷"
        } else {
            navigationController?.tabBarController?.tabBar.items![0].badgeValue = nil
        }
    }
}

extension MainTableViewController: MainTableViewControllerDelegate {
    func update() {
        fetchData()
        tableView.reloadData()
        changeTabBarBadgeValue()
    }
}

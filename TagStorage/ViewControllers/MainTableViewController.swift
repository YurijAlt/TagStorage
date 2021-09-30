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
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tags.count
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let tag = tags[indexPath.row]
        cell.tagImage.image = UIImage(named: "tshort")
        cell.tagNameLabel.text = tag.name
        cell.TagBrandLabel.text = tag.brand
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        126
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
            self.navigationController?.tabBarController?.tabBar.items![0].badgeColor = #colorLiteral(red: 0.70562011, green: 0.8036544919, blue: 0.7539008856, alpha: 1)
            self.navigationController?.tabBarController?.tabBar.items![0].badgeValue = "\(tags.count)🏷"
        } else {
            self.navigationController?.tabBarController?.tabBar.items![0].badgeValue = nil
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

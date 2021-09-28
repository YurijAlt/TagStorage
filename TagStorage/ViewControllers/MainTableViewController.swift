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
        return tags.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)
        let tag = tags[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = tag.name
        content.textProperties.color = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        content.secondaryText = tag.brand
        content.secondaryTextProperties.color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        content.image = UIImage(named: "tag")
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
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
            self.navigationController?.tabBarController?.tabBar.items![0].badgeColor = #colorLiteral(red: 0.2870845795, green: 0.8194509149, blue: 0.7614896894, alpha: 1)
            self.navigationController?.tabBarController?.tabBar.items![0].badgeValue = "\(tags.count)🏷"
        } else {
            self.navigationController?.tabBarController?.tabBar.items![0].badgeColor = #colorLiteral(red: 0.3450009227, green: 0.3846887648, blue: 0.4445621371, alpha: 1)
            self.navigationController?.tabBarController?.tabBar.items![0].badgeValue = "0🏷"
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

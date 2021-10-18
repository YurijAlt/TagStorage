//
//  SettingsTableViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 07.10.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "back")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.settingsMenu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: DataManager.shared.settingsImages[indexPath.row])
        content.text = DataManager.shared.settingsMenu[indexPath.row]
        content.textProperties.color = UIColor.purple
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

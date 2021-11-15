//
//  WhatsNewTableViewController.swift
//  TagStorage
//
//  Created by Юрий Альт on 01.11.2021.
//

import UIKit

class WhatsNewTableViewController: UITableViewController {

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "back")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.buildVersions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhatsNewTableViewCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.attributedText = NSMutableAttributedString()
            .bold("\(DataManager.shared.buildVersions[indexPath.row])")
        content.secondaryText = DataManager.shared.buildVersionsDescription[indexPath.row]
        content.secondaryTextProperties.color = UIColor(named: "textColor") ?? UIColor.purple
        content.textProperties.color = UIColor(named: "textColor") ?? UIColor.purple
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

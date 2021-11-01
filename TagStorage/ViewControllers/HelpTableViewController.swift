//
//  HelpTableViewController.swift
//  TagStorage
//
//  Created by Юрий Чекалюк on 07.10.2021.
//

import UIKit

class HelpTableViewController: UITableViewController {

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.red
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HelpTableViewCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = "Test. 1. How take a photo of my thing"
        
        cell.contentConfiguration = content

        return cell
    }
}

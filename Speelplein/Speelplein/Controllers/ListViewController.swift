//
//  ListViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 17/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var categories = [Categorie]()
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedCategories = Categorie.loadCategories() {
            categories = savedCategories
        } else {
            categories = Categorie.loadSampleCategories()
        }
    }
    
    // TableView overrides
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categories.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories[section].spelen.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpelCell")
            else { fatalError("Could not dequeue") }
        let spel = self.categories[indexPath.section].spelen[indexPath.row]
        cell.textLabel?.text = spel.titel
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.categories[section].naam.rawValue
    }
}

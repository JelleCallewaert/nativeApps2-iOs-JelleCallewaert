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
        guard segue.identifier == "saveSpelUnwind" else { return }
        let sourceViewController = segue.source as! SpelTableViewController
        if let spel = sourceViewController.spel {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // EDIT
                categories[selectedIndexPath.section].spelen[selectedIndexPath.row] = spel
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // NIEUW
                for cat: PossibleCategorie in sourceViewController.selectedCategories {
                    var newIndexPath: IndexPath!
                    if cat == .kleuters {
                        newIndexPath = IndexPath(row: self.categories[0].spelen.count, section: 0)
                        addCell(indexPath: newIndexPath, spel: spel)
                    }
                    if cat == .creatief {
                        newIndexPath = IndexPath(row: self.categories[1].spelen.count, section: 1)
                        addCell(indexPath: newIndexPath, spel: spel)
                    }
                    if cat == .actief {
                        newIndexPath = IndexPath(row: self.categories[2].spelen.count, section: 2)
                        addCell(indexPath: newIndexPath, spel: spel)
                    }
                    if cat == .kastaards {
                        newIndexPath = IndexPath(row: self.categories[3].spelen.count, section: 3)
                        addCell(indexPath: newIndexPath, spel: spel)
                    }
                }
            }
        }
    }
    
    // Helper functions
    func addCell(indexPath: IndexPath, spel: Spel) {
        self.categories[indexPath.section].spelen.append(spel)
        updateAll()
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            // SOURCE: https://stackoverflow.com/questions/28788416/swift-prepareforsegue-with-navigation-controller
            let navigationController = segue.destination as! UINavigationController
            let spelDetailsViewController = navigationController.topViewController as! SpelDetailsViewController
            // END SOURCE
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedSpel = categories[indexPath.section].spelen[indexPath.row]
            spelDetailsViewController.spel = selectedSpel
            spelDetailsViewController.categorie = categories[indexPath.section].naam
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        let tabbar = tabBarController as! MainTabBarController
        categories = tabbar.categories
    }
    
    func updateAll() {
        let tabbar = tabBarController as! MainTabBarController
        tabbar.categories = categories
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            categories[indexPath.section].spelen.remove(at: indexPath.row)
            updateAll()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

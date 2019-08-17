//
//  SpelTableViewController.swift
//  Speelplein Grabbis
//
//  Created by Jelle Callewaert on 16/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class SpelTableViewController: UITableViewController {
    var secties = [Sectie]()
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedSecties = Sectie.loadSecties() {
            secties = savedSecties
        } else {
            secties = Sectie.loadSampleSecties()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.secties.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let spelen = self.secties[section].spelen
        return spelen.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.secties[section].naam.rawValue
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpelCell")
            else { fatalError("Could not dequeue a cell")}
        let spel = secties[indexPath.section].spelen[indexPath.row]
        cell.textLabel?.text = spel.titel
        return cell
    }
}

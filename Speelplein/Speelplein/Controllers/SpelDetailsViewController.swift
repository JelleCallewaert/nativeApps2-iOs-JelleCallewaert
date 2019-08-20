//
//  SpelDetailsViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 19/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class SpelDetailsViewController: UIViewController {
    var spel: Spel?
    var categorie: PossibleCategorie?
    var mode: Mode?
    
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var beschrijvingLabel: UILabel!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSpel" {
            let navigationController = segue.destination as! UINavigationController
            let spelTableViewController = navigationController.topViewController as! SpelTableViewController
            spelTableViewController.spel = spel
            spelTableViewController.selectedCategories = [categorie] as! [PossibleCategorie]
        }
    }
    
    override func viewDidLoad() {
        titelLabel.text = spel?.titel
        beschrijvingLabel.text = spel?.beschrijving
        if mode == .random {
            editButton.isEnabled = false
        }
    }
}

enum Mode {
    case details
    case random
}

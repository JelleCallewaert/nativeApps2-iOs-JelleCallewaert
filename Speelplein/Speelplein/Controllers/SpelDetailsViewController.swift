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
    
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var beschrijvingLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSpel" {
            let navigationController = segue.destination as! UINavigationController
            let spelTableViewController = navigationController.topViewController as! SpelTableViewController
            spelTableViewController.spel = spel
            spelTableViewController.selectedCategories.append(categorie!)
        }
    }
    
    override func viewDidLoad() {
        titelLabel.text = spel?.titel
        beschrijvingLabel.text = spel?.beschrijving
    }
}

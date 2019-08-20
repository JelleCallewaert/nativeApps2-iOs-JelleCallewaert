//
//  FirstViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 17/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {
    var categories = [Categorie]()
    
    @IBAction func randomizeButtonClicked(_ sender: UIButton) {
        print("random clicked")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRandomDetails" {
            let navController = segue.destination as! UINavigationController
            let spelDetailsViewController = navController.topViewController as! SpelDetailsViewController
            spelDetailsViewController.spel = selectRandomSpel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        if let savedCategories = Categorie.loadCategories() {
            categories = savedCategories
        } else {
            categories = Categorie.loadSampleCategories()
        }
    }
    
    // helper function
    func selectRandomSpel() -> Spel {
        let randomCatIndex = Int.random(in: 0 ..< categories.count)
        let randomSpelIndex = Int.random(in: 0 ..< categories[randomCatIndex].spelen.count)
        let spel = categories[randomCatIndex].spelen[randomSpelIndex]
        return spel
    }

}


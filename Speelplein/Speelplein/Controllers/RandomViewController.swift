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
    var categorie: PossibleCategorie?
    
    @IBOutlet weak var randomizeButton: UIButton!
    
    @IBAction func unwindToRandom(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRandomDetails" {
            let navController = segue.destination as! UINavigationController
            let randomDetailsViewController = navController.topViewController as! RandomDetailsViewController
            randomDetailsViewController.spel = selectRandomSpel()
            randomDetailsViewController.categorie = categorie
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabbar = tabBarController as! MainTabBarController
        categories = tabbar.categories
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            randomizeButton.sendActions(for: .touchUpInside)
        }
    }
    
    // helper function
    func selectRandomSpel() -> Spel {
        let randomCatIndex = Int.random(in: 0 ..< categories.count)
        categorie = categories[randomCatIndex].naam
        guard categories[randomCatIndex].spelen.count > 0 else { return Spel(titel: "Error", beschrijving: "Geen spelen gevonden in categorie " + categorie!.rawValue )}
        let randomSpelIndex = Int.random(in: 0 ..< categories[randomCatIndex].spelen.count)
        let spel = categories[randomCatIndex].spelen[randomSpelIndex]
        return spel
    }

}


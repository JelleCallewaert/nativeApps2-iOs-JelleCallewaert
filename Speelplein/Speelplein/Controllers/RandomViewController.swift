//
//  FirstViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 17/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController, RandomDetailsDelegate {
    var spel: Spel?
    var categories = [Categorie]()
    var categorie: PossibleCategorie?
    
    @IBOutlet weak var randomizeButton: UIButton!
    
    @IBAction func unwindToRandom(segue: UIStoryboardSegue) {
        
    }
    
    func shakeDetected(sender: RandomDetailsViewController) {
        selectRandomSpel()
        sender.spel = spel
        sender.categorie = categorie
        sender.updateView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRandomDetails" {
            selectRandomSpel()
            let navController = segue.destination as! UINavigationController
            let randomDetailsViewController = navController.topViewController as! RandomDetailsViewController
            randomDetailsViewController.spel = spel
            randomDetailsViewController.categorie = categorie
            randomDetailsViewController.delegate = self
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
    func selectRandomSpel() {
        let randomCatIndex = Int.random(in: 0 ..< categories.count)
        categorie = categories[randomCatIndex].naam
        guard categories[randomCatIndex].spelen.count > 0 else {
            self.spel = Spel(titel: "Error", beschrijving: "Geen spelen gevonden in categorie " + categorie!.rawValue)
            return
        }
        let randomSpelIndex = Int.random(in: 0 ..< categories[randomCatIndex].spelen.count)
        let spel = categories[randomCatIndex].spelen[randomSpelIndex]
        self.spel = spel
    }

}


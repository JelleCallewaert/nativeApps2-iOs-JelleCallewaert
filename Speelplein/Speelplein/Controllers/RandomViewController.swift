//
//  FirstViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 17/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController, RandomDetailsDelegate {
    var categories = [Categorie]()
    var spel: Spel?
    
    @IBOutlet weak var randomizeButton: UIButton!
    
    @IBAction func unwindToRandom(segue: UIStoryboardSegue) {
        
    }
    
    func shakeDetected(sender: RandomDetailsViewController) {
        selectRandomSpel()
        sender.spel = spel
        sender.updateView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRandomDetails" {
            selectRandomSpel()
            let navController = segue.destination as! UINavigationController
            let randomDetailsViewController = navController.topViewController as! RandomDetailsViewController
            randomDetailsViewController.spel = spel
            randomDetailsViewController.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let mainTabBarController = tabBarController as! MainTabBarController
        categories = mainTabBarController.categories
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
        var nietLegeCategorieen = [Categorie]()
        for cat in categories {
            if !cat.spelen.isEmpty {
                nietLegeCategorieen.append(cat)
            }
        }
        guard !nietLegeCategorieen.isEmpty else {
            spel = Spel(titel: "Error", beschrijving: "Geen spelen gevonden ..")
            return
        }
        let randomCategorieIndex = Int.random(in: 0 ..< nietLegeCategorieen.count)
        let randomSpelIndex = Int.random(in: 0 ..< nietLegeCategorieen[randomCategorieIndex].spelen.count)
        spel = nietLegeCategorieen[randomCategorieIndex].spelen[randomSpelIndex]
    }
}

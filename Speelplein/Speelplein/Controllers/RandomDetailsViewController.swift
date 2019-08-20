//
//  RandomDetailsViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 20/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class RandomDetailsViewController: UIViewController {
    var spel: Spel?
    var categorie: PossibleCategorie?
    
    @IBOutlet weak var randomTitelLabel: UILabel!
    @IBOutlet weak var randomBeschrijvingLabel: UILabel!
    
    override func viewDidLoad() {
        randomTitelLabel.text = spel?.titel
        randomBeschrijvingLabel.text = spel?.beschrijving
    }
}

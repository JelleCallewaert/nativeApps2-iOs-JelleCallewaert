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
    
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var beschrijvingLabel: UILabel!
    
    override func viewDidLoad() {
        titelLabel.text = spel?.titel
        beschrijvingLabel.text = spel?.beschrijving
    }
}

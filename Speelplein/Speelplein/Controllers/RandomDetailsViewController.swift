//
//  RandomDetailsViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 20/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

@objc protocol RandomDetailsDelegate: class {
    func shakeDetected(sender: RandomDetailsViewController)
}
class RandomDetailsViewController: UIViewController {
    var spel: Spel?
    var delegate: RandomDetailsDelegate?
    
    @IBOutlet weak var randomTitelLabel: UILabel!
    @IBOutlet weak var randomBeschrijvingLabel: UILabel!
    
    override func viewDidLoad() {
        updateView()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            delegate?.shakeDetected(sender: self)
        }
    }
    
    func updateView() {
        randomTitelLabel.text = spel?.titel
        randomBeschrijvingLabel.text = spel?.beschrijving
    }
}

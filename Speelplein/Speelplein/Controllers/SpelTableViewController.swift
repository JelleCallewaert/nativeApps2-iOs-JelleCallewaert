//
//  NieuwSpelTableViewController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 17/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class SpelTableViewController: UITableViewController {
    var spel: Spel?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var spelTitelField: UITextField!
    @IBOutlet weak var spelBeschrijvingField: UITextView!
    
    @IBOutlet weak var kleuterSwitch: UISwitch!
    @IBOutlet weak var creatiefSwitch: UISwitch!
    @IBOutlet weak var actiefSwitch: UISwitch!
    @IBOutlet weak var kastaardsSwitch: UISwitch!
    
    @IBAction func titelFieldChanged(_ sender: UITextField) {
        changeSaveButtonState()
    }
    @IBAction func titelFieldReturnPressed(_ sender: UITextField) {
        spelTitelField.resignFirstResponder()
    }
    @IBAction func categorieSwitchClicked(_ sender: UISwitch) {
        changeSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSaveButtonState()
    }
    
    // Helper function
    func changeSaveButtonState() {
        let titel = spelTitelField.text ?? ""
        let categorieSelected = kleuterSwitch.isOn || creatiefSwitch.isOn || actiefSwitch.isOn || kastaardsSwitch.isOn
        
        let enabled = !titel.isEmpty
            && categorieSelected
        saveButton.isEnabled = enabled
    }
}

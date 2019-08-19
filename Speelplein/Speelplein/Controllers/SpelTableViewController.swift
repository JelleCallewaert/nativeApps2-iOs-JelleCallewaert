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
    var selectedCategories = [PossibleCategorie]()
    
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
        changeCategories()
        changeSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let spel = spel {
            navigationItem.title = "Edit spel"
            spelTitelField.text = spel.titel
            spelBeschrijvingField.text = spel.beschrijving
            let cat = selectedCategories[0]
            if cat != .kleuters { kleuterSwitch.isOn = false }
            if cat != .actief { actiefSwitch.isOn = false }
            if cat != .creatief { creatiefSwitch.isOn = false }
            if cat != .kastaards { kastaardsSwitch.isOn = false }
            kleuterSwitch.isEnabled = false
            actiefSwitch.isEnabled = false
            creatiefSwitch.isEnabled = false
            kastaardsSwitch.isEnabled = false
        }
        changeSaveButtonState()
        changeCategories()
    }
    
    // Helper function
    func changeSaveButtonState() {
        let titel = spelTitelField.text ?? ""
        let aCategorieSelected = kleuterSwitch.isOn || creatiefSwitch.isOn || actiefSwitch.isOn || kastaardsSwitch.isOn
        
        let enabled = !titel.isEmpty
            && aCategorieSelected
        saveButton.isEnabled = enabled
    }
    func changeCategories() {
        var selectedCategories = [PossibleCategorie]()
        if kleuterSwitch.isOn {
            selectedCategories.append(.kleuters)
        }
        if creatiefSwitch.isOn {
            selectedCategories.append(.creatief)
        }
        if actiefSwitch.isOn {
            selectedCategories.append(.actief)
        }
        if kastaardsSwitch.isOn {
            selectedCategories.append(.kastaards)
        }
        self.selectedCategories = selectedCategories
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveNieuwSpelUnwind" else { return }
        
        let titel = spelTitelField.text!
        let beschrijving = spelBeschrijvingField.text
        
        spel = Spel(titel: titel, beschrijving: beschrijving)
    }
}

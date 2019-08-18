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
    var categories = [PossibleCategorie]()
    
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
        categories = selectedCategories
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveNieuwSpelUnwind" else { return }
        
        let titel = spelTitelField.text!
        let beschrijving = spelBeschrijvingField.text
        
        spel = Spel(titel: titel, beschrijving: beschrijving)
    }
}

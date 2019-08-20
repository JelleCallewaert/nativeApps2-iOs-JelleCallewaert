//
//  MainTabBarController.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 20/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    var categories = [Categorie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedCategories = Categorie.loadCategories() {
            categories = savedCategories
        } else {
            categories = Categorie.loadSampleCategories()
        }
    }
}

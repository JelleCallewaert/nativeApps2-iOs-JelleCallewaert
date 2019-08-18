//
//  Categorie.swift
//  Speelplein
//
//  Created by Jelle Callewaert on 17/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import Foundation

struct Categorie {
    let naam: PossibleCategorie
    var spelen: [Spel]

    static func loadCategories() -> [Categorie]? {
        return nil
    }
    
    static func loadSampleCategories() -> [Categorie] {
        let kleuterspelen = [
            Spel(titel: "kleuter1", beschrijving: "?"),
            Spel(titel: "kleuter2", beschrijving: "?"),
            Spel(titel: "kleuter3", beschrijving: "?"),
            ]
        let creatiefspelen = [
            Spel(titel: "creatief1", beschrijving: "?"),
            Spel(titel: "creatief2", beschrijving: "?"),
            Spel(titel: "creatief3", beschrijving: "?"),
            ]
        let actiefspelen = [
            Spel(titel: "actief1", beschrijving: "?"),
            Spel(titel: "actief2", beschrijving: "?"),
            Spel(titel: "actief3", beschrijving: "?"),
            ]
        let kastaardsspelen = [
            Spel(titel: "kastaards1", beschrijving: "?"),
            Spel(titel: "kastaards2", beschrijving: "?"),
            Spel(titel: "kastaards3", beschrijving: "?"),
            ]
        let Categories = [
            Categorie(naam: .kleuters, spelen: kleuterspelen),
            Categorie(naam: .creatief, spelen: creatiefspelen),
            Categorie(naam: .actief, spelen: actiefspelen),
            Categorie(naam: .kastaards, spelen: kastaardsspelen),
            ]
        return Categories
    }
}

enum PossibleCategorie: String {
    case kleuters
    case actief
    case creatief
    case kastaards
}

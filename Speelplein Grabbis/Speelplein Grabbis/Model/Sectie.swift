//
//  Categorie.swift
//  Speelplein Grabbis
//
//  Created by Jelle Callewaert on 16/08/19.
//  Copyright © 2019 Jelle Callewaert. All rights reserved.
//

import UIKit

struct Sectie {
    let naam: Categorie
    var spelen: [Spel]
    
    static func loadSecties() -> [Sectie]? {
        return nil
    }
    static func loadSampleSecties() -> [Sectie] {
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
        let secties = [
            Sectie(naam: Categorie.kleuters, spelen: kleuterspelen),
            Sectie(naam: Categorie.creatief, spelen: creatiefspelen),
            Sectie(naam: Categorie.actief, spelen: actiefspelen),
            Sectie(naam: Categorie.kastaards, spelen: kastaardsspelen),
        ]
        return secties
    }
}

enum Categorie: String {
    case kleuters
    case actief
    case creatief
    case kastaards
}


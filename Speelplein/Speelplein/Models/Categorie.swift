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
            Spel(titel: "Tik Tak Boem", beschrijving: "De kindjes gaan in een cirkel staan. 1 kindje zit in het midden, deze wordt geblinddoekt. Deze zegt dan 'Tik Tak, Tik Tak, ... De spelers in de kring geven dan een object door. Wanneer de middelste speler plots 'Boem' zegt, is de speler die het object vast heeft af. Deze moet gaan zitten. Dit wordt herhaald tot er maar 1 speler over blijft. Die is gewonnen."),
            Spel(titel: "Cactus bloem", beschrijving: "De kindjes gaan in een cirkel zitten, behalve 1 zoeker. Die moet eventjes weg, terwijl de rest 1 speler aanduiden die de bloem is. De rest speelt cactus. Wanneer de bloem gekozen is, mag de zoeker terugkomen. Deze moet de bloem zoeken door op de schoot van de andere spelers te gaan zitten. Als die op een cactus terechtkomt, moet de cactus in de bil knijpen. De zoeker wint als hij de bloem gevonden heeft."),
            Spel(titel: "Schipper mag ik overvaren", beschrijving: "Alle kindjes staan op een rijtje. Ze moeten eerst het liedje 'Schipper mag ik overvaren' zingen. Daarna zegt de tikker wie overmag of niet overmag (vb: iedereen met witte kleren mag niet over). De spelers die niet voldoen aan de eisen van de tikker, moeten over geraken zonder getikt te worden. Wie getikt is wordt de volgende ronde ook tikker. Herhaal tot 1 iemand overblijft."),
            ]
        let creatiefspelen = [
            Spel(titel: "Ganzenbord", beschrijving: "Maak zelf een groot ganzenbord. Duid enkele vakjes aan met een kleurtje of een tekening. De spelers mogen dan om beurt gooien met een dobbelsteen. Als ze op zo'n vakje komen, moeten ze een opdracht volbrengen. Lukt dit niet moeten ze de volgende beurt overslaan. De eerste die op het einde geraakt, wint."),
            Spel(titel: "Fruitbrochette", beschrijving: "Laat de kinderen zelf enkele stukken fruit (en groente) pellen, snijden .. Wees voorzichtig met scherpe messen!! Snij desnoods zelf de stukjes voor de kleinste kinderen. Daarna mag iedereen de stukjes kiezen die hij/zij op zijn brochette wilt. Daarna mag je hem opeten."),
            Spel(titel: "1 tegen allen", beschrijving: "Maak een bord met veel kleine opdrachtjes. Elk kind kan een opdrachtje kiezen die hij/zij wenst te vervullen. Als elke opdracht vervuld is, wint de groep. Anders kan je de kinderen een 'straf' opleggen."),
            ]
        let actiefspelen = [
            Spel(titel: "Paintball", beschrijving: "Meng bloem en water in een emmer. Hiermee kan je een grote brok deeg maken. Iedere speler krijgt een stukje als munitie. Met een PVC buis kan je kleine bolletjes deeg afschieten door een beetje deeg in de buis te steken en vervolgens op de buis te blazen."),
            Spel(titel: "Handelspel", beschrijving: "De kinderen worden verdeeld in 3 groepen. Groep 1 kan de waren enkel kopen van de bank (gecontroleerd door de begeleiding). Groep 2 koopt de waren over van Groep 1 en Groep 3 enkel van Groep 2. De kinderen moeten zelf een geschikte prijs onderhandelen. Als laatste kan Groep 3 verkopen aan de begeleiding. Zorg zelf voor een dynamische prijs om het een beetje interessant te maken. Wie op het einde het meeste geld heeft, wint."),
            ]
        let kastaardsspelen = [
            Spel(titel: "Kasteel bouw", beschrijving: "Laat de kinderen vrij kiezen wat ze willen bouwen, maak desnoods een 'vergadering' waar iedereen kan kiezen wat er gebouwd gaat worden. Daarna kan je ze laten bouwen. Probeer de kinderen zelf zoveel mogelijk werk te laten doen. Kom enkel tussen bij onveilige of lastige situaties."),
            Spel(titel: "Stadspel", beschrijving: "Hang in de stad enkele blaadjes op, best in bekende plaatsen. Geef de kinderen een kaart met daarop deze interessante plaatsen gemarkeerd. Bij elke plaats moeten ze een opdracht vervullen. (vb: Maak een foto met een voorbijganger) De kinderen moeten kunnen bewijzen dat ze de opdracht vervuld hebben. De groep die als eerste terug is, wint."),
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

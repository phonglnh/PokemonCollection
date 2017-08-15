//
//  Pokemon.swift
//  PokemonCollection
//
//  Created by PhongLe on 5/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon {
    
    var name: String!
    var image: UIImage!
    var type: String!

    init(name: String, image: UIImage, type: String) {
        self.name = name
        self.image = image
        self.type = type
    }
    
    static func getPokemons() -> [Pokemon]{
        return [
            Pokemon(name: "001", image: UIImage(named: "001")!, type: "T"),
            Pokemon(name: "002", image: UIImage(named: "002")!, type: "T"),
            Pokemon(name: "003", image: UIImage(named: "003")!, type: "T"),
            Pokemon(name: "004", image: UIImage(named: "004")!, type: "F"),
            Pokemon(name: "005", image: UIImage(named: "005")!, type: "F"),
            Pokemon(name: "006", image: UIImage(named: "006")!, type: "F"),
            Pokemon(name: "007", image: UIImage(named: "007")!, type: "W"),
            Pokemon(name: "008", image: UIImage(named: "008")!, type: "W"),
            Pokemon(name: "009", image: UIImage(named: "009")!, type: "W"),
            Pokemon(name: "010", image: UIImage(named: "010")!, type: "T"),
            Pokemon(name: "011", image: UIImage(named: "011")!, type: "T"),
            Pokemon(name: "012", image: UIImage(named: "012")!, type: "T"),
            Pokemon(name: "013", image: UIImage(named: "013")!, type: "S"),
            Pokemon(name: "014", image: UIImage(named: "014")!, type: "S"),
            Pokemon(name: "015", image: UIImage(named: "015")!, type: "S"),
            Pokemon(name: "016", image: UIImage(named: "016")!, type: "S"),
            Pokemon(name: "017", image: UIImage(named: "017")!, type: "S"),
            Pokemon(name: "018", image: UIImage(named: "018")!, type: "S"),
            Pokemon(name: "019", image: UIImage(named: "019")!, type: "G"),
            Pokemon(name: "020", image: UIImage(named: "020")!, type: "G"),
            Pokemon(name: "021", image: UIImage(named: "021")!, type: "S"),
            Pokemon(name: "022", image: UIImage(named: "022")!, type: "S"),
            Pokemon(name: "023", image: UIImage(named: "023")!, type: "F"),
            Pokemon(name: "024", image: UIImage(named: "024")!, type: "F"),
            Pokemon(name: "025", image: UIImage(named: "025")!, type: "T"),
            Pokemon(name: "026", image: UIImage(named: "026")!, type: "T"),
            Pokemon(name: "027", image: UIImage(named: "027")!, type: "G"),
            Pokemon(name: "028", image: UIImage(named: "028")!, type: "G"),
            Pokemon(name: "029", image: UIImage(named: "029")!, type: "G"),
            Pokemon(name: "030", image: UIImage(named: "030")!, type: "G"),
            Pokemon(name: "031", image: UIImage(named: "031")!, type: "G"),
            Pokemon(name: "032", image: UIImage(named: "032")!, type: "G"),
            Pokemon(name: "033", image: UIImage(named: "033")!, type: "G"),
            Pokemon(name: "034", image: UIImage(named: "034")!, type: "G"),
            Pokemon(name: "035", image: UIImage(named: "035")!, type: "F"),
            Pokemon(name: "036", image: UIImage(named: "036")!, type: "F"),
            Pokemon(name: "037", image: UIImage(named: "037")!, type: "S"),
            Pokemon(name: "038", image: UIImage(named: "038")!, type: "W"),
            Pokemon(name: "039", image: UIImage(named: "039")!, type: "W"),
            Pokemon(name: "040", image: UIImage(named: "040")!, type: "W"),
            Pokemon(name: "041", image: UIImage(named: "041")!, type: "F")
        ]
    }
    
    static func getPokePerType() -> [Int: [Pokemon]] {
        let dataPoke = self.getPokemons()
        
        var dictPoke: [Int: [Pokemon]] =  [Int: [Pokemon]]()
        
        dictPoke[0] = dataPoke.filter({$0.type == "F"})
        dictPoke[1] = dataPoke.filter({$0.type == "W"})
        dictPoke[2] = dataPoke.filter({$0.type == "G"})
        dictPoke[3] = dataPoke.filter({$0.type == "T"})
        dictPoke[4] = dataPoke.filter({$0.type == "S"})
        
        return dictPoke
        
    }
    
}


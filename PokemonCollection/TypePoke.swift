//
//  TypePoke.swift
//  PokemonCollection
//
//  Created by PhongLe on 5/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import Foundation
import UIKit

struct TypePoke {
    var image: UIImage!
    var name: String!
    var color: UIColor!
    
    init(image: UIImage, name: String, color: UIColor) {
        self.image = image
        self.name = name
        self.color = color
    }
    
    static func getTypePoke() -> [TypePoke] {
        return [
            TypePoke(image: UIImage(named: "004")!, name: "🔥 FIRE", color: UIColor.red),
            TypePoke(image: UIImage(named: "007")!, name: "💦 WATER", color: UIColor(red: 0.44, green: 0.66, blue: 0.9, alpha: 1)),
            TypePoke(image: UIImage(named: "027")!, name: "🍀 TREE", color: UIColor.brown),
            TypePoke(image: UIImage(named: "001")!, name: "⛰ GROUND", color: UIColor(red: 0.38, green: 0.80, blue: 0.19, alpha: 1)),
            TypePoke(image: UIImage(named: "016")!, name: "⛅️ SKY", color: UIColor.blue)
        ]
    }
}

//
//  PokeCollectionCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 5/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class PokeCollectionCell: UICollectionViewCell {
 
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myPoke: Pokemon! {
        didSet {
            setupPokeProfile()
        }
    }
    
    func setupPokeProfile(){
        self.pokeImageView.image = myPoke.image
        self.nameLabel.text = myPoke.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}

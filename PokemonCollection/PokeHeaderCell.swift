//
//  PokeHeaderCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 5/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class PokeHeaderCell: UITableViewCell {
    @IBOutlet weak var typeNameLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    
    var myTypePoke: TypePoke! {
        didSet {
            setupTypePoke()
        }
    }

    func setupTypePoke() {
        self.typeNameLabel.text = myTypePoke.name
        //self.typeNameLabel.textColor = myTypePoke.color
        //self.seeAllButton.setTitleColor(myTypePoke.color, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func seeAllButtonTapped(_ sender: AnyObject){
        print("hello")
    }
    
}

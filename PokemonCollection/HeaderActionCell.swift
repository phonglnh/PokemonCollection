//
//  HeaderActionCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 6/1/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class HeaderActionCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func photoButtonTapped(_ sender: Any) {
        print("photo")
    }
 
    @IBAction func bookmarkButtonTapped(_ sender: Any) {
        print("bookmark")
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        print("share")
    }
    
}

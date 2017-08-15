//
//  CommentCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 6/2/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var userProfileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.bounds.size.width / 2
        userProfileImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

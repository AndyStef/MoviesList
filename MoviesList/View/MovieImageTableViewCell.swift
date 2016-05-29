//
//  MovieImageTableViewCell.swift
//  MoviesList
//
//  Created by Andyy on 5/29/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import UIKit

class MovieImageTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

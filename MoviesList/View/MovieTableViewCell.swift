//
//  MovieTableViewCell.swift
//  MoviesList
//
//  Created by Andyy on 5/20/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    //Mark:Outlets
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieRateLabel: UILabel!
    
    //MARK:Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

//
//  CustomCell.swift
//  CustomTableView
//
//  Created by ReasonAmu on 8/10/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var lblStadium: UILabel!
    @IBOutlet weak var lblFootBallClub: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

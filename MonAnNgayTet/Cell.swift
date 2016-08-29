//
//  Cell.swift
//  MonAnNgayTet
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    var nameLabel : UILabel!
    var imageViewCell :UIImageView!
    var kCellWidth: CGFloat = 320
    var kCellHeight :CGFloat = 200
    var kLabelHeight :CGFloat = 50
    
    func addSubViews(){
        
        //-- add Image
        if (imageViewCell == nil){
            
            imageViewCell = UIImageView(frame: CGRectMake(0, 0, kCellWidth,kCellHeight))
            imageViewCell.layer.borderColor = tintColor.CGColor
            contentView.addSubview(imageViewCell)
        }
        
        //-- add Label
        if (nameLabel == nil) {
            
            nameLabel = UILabel(frame: CGRectMake(0,0,kCellWidth,kLabelHeight))
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor.redColor()
            nameLabel.font = UIFont.boldSystemFontOfSize(16)
            contentView.addSubview(nameLabel)
        }
        
        
    }

}

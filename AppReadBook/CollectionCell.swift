//
//  CollectionCell.swift
//  AppReadBook
//
//  Created by ReasonAmu on 8/17/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

let kCellWidth: CGFloat = 100
let kLabelHeight: CGFloat = 20

class CollectionCell: UICollectionViewCell {
    var nameLabel: UILabel!
    var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addAllSubviews()
        invalidateIntrinsicContentSize()
    }
    
    
    //-- khoi tao chieu cao, chieu rong cua 1 cell trong collectionview
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(kCellWidth,kCellWidth + kLabelHeight);
        
    }
    
  
    
  
    func addAllSubviews(){
        
        if(imageView == nil){
            imageView = UIImageView(frame: CGRectMake(0, 0, kCellWidth, kCellWidth))
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
            
        }
        if (nameLabel == nil) {
            nameLabel = UILabel(frame: CGRectMake(0,kCellWidth,kCellWidth,kLabelHeight))
            nameLabel.textAlignment = .Center
            nameLabel.textColor = UIColor.whiteColor()
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFontOfSize(12)
            contentView.addSubview(nameLabel)
            
        
        
        }
        
        
    }
    override var selected: Bool{
        didSet{
            imageView.layer.borderWidth  = selected ? 2 : 0
        }
    }
    



}

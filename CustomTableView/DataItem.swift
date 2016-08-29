//
//  DataItem.swift
//  CustomTableView
//
//  Created by ReasonAmu on 8/10/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DataItem {
    
    var imageLogo: UIImage!
    var nameFootBallClub : String!
    var nameStadium: String!
    var imageStarRating: UIImage!
    
    
    //-- khoi tao
    init(nameFC: String , nameStd : String, imgLogo:String,imgStar:Int){
        self.imageLogo = UIImage(named: imgLogo)
        self.imageStarRating = UIImage(named: "\(imgStar)stars.png")
        self.nameStadium = nameStd
        self.nameFootBallClub = nameFC
    }
    
}
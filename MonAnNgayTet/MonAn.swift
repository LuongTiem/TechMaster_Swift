//
//  MonAn.swift
//  MonAnNgayTet
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import Foundation
import UIKit

class MonAn {
    var name : String?
    var photo : UIImage?
    
    init(name:String,photo:String){
        
        self.name = name
        self.photo = UIImage(named: "\(photo).jpg")
    }
    
    
    
    
}

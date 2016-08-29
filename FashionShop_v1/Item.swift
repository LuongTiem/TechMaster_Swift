//
//  Item.swift
//  FashionShop_v1
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class Item: NSObject{
    
    var name:String?
    var content:String?
    var nameImages:[String] = []
    var price:String?
    init(name:String, content:String , nameImage : [String],price: String) {
        
        self.name = name
        self.content = content
        self.nameImages = nameImage
        self.price = price
    }
}

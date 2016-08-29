//
//  Book.swift
//  AppReadBook
//
//  Created by ReasonAmu on 8/17/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import Foundation
import UIKit

class Book {
  
    var title:String = ""
    var book: [String]? = []
    
    
    init(title :String , book : [String]?){
        
        self.title = title
        self.book = book
    }
    init(title :String){
        self.title = title
    }
    
 
    
}
//
//  DataManager.swift
//  MonAnNgayTet
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import Foundation



class DataManager {
    
    var data = NSMutableArray()
     //-- sung dung ky thuat singleton -
    
    
     class var  shareInstance: DataManager{
        //-- khai bao struct
        struct Static {
            static var onceToken  = dispatch_once_t(0)
            static var instance :DataManager? = nil
            
        }
        
        //--
        dispatch_once(&Static.onceToken) {
            Static.instance = DataManager()
            let filePath = NSBundle.mainBundle().pathForResource("CacMonAn", ofType: "plist")
            let raw  = NSDictionary(contentsOfFile: filePath!)
            let temp =  NSMutableArray(capacity: raw!.count)
            for item in raw!{
                
                let monan = MonAn(name: item.value.objectForKey("name") as! String, photo: item.value.objectForKey("photo") as! String)
                temp.addObject(monan)
                
            }
            Static.instance?.data = NSMutableArray(array: temp)
            
        }
        return Static.instance!
    
    }
    
    
}

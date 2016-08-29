//
//  Song.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/22/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import Foundation
import UIKit
struct Song {
    var title = ""
    var artistName = ""
    var thumbnail : UIImage!
    var sourceOnline = ""
    var sourceLocal = ""
    var localThumb = ""
    var baseThumb = "http://image.mp3.zdn.vn//thumb/240_240/"
    var kCheckDownload :Bool = true
    
    //--
    init(title: String,artistName : String, thumbnail : String,sourceOnline : String ){
        self.title = title
        self.artistName = artistName
        self.sourceOnline  = sourceOnline
        let thumbnailURL = baseThumb + thumbnail
        let dataImage = NSData(contentsOfURL: NSURL(string: thumbnailURL)!)
        self.thumbnail = UIImage(data: dataImage!)
    }
    
    //--
    init(title: String,artistName : String, localThumbnail : String,sourceLocal: String ){
        self.title = title
        self.artistName = artistName
        self.sourceLocal  = sourceLocal
        self.localThumb = localThumbnail
        let dataImage = NSData(contentsOfFile: self.localThumb)
        self.thumbnail = UIImage(data: dataImage!)
        
    }
    
}

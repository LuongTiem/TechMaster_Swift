//
//  DetailVC.swift
//  MonAnNgayTet
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var dataSend:MonAn?
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.navigationBarHidden  = false
        //-- test title navigation
        self.title = dataSend?.name
        self.navigationController?.navigationBar.tintColor = setColor(2) //-- mau item back
        self.navigationController?.navigationBar.barTintColor = setColor(0) //-- mau nen navigationbar
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : setColor(1)] // -- mau chu tittle 
        
        
        //-- add subview
        
         let label = UILabel(frame: CGRectMake(self.view.frame.width/2 - 50, 80 , 100 , 20))
                label.textAlignment = .Center
                label.font  = UIFont.boldSystemFontOfSize(16)
                label.textColor = setColor(3)
                label.text  =  dataSend?.name
        
        let img = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            img.contentMode = .ScaleAspectFit
            img.image = dataSend?.photo
        self.view.addSubview(img)
        self.view.addSubview(label)
        
    }


    func setColor(value : Int) -> UIColor {
        
        var color:UIColor =  UIColor()
        switch value {
        case 0:
            color = UIColor(red: 174/255, green: 173/255, blue: 217/255, alpha: 0.7) //-- xanh
            break
        case 1:
             color = UIColor(red: 248/255, green: 227/255, blue: 62/255, alpha: 1) //-- vang
            break
        case 2:
             color = UIColor(red: 239/255, green: 239/255, blue: 227/255, alpha: 1) //-- trang
            break
        case 3:
            color = UIColor(red: 255/255, green: 32/255, blue: 44/255, alpha: 1) //-- do
            break

        default:
            color  = UIColor.whiteColor()
            break
        }
        
        
        return color
    }
    
}

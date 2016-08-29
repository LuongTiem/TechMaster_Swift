//
//  HookerView.swift
//  GameFish1
//
//  Created by ReasonAmu on 7/30/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class HookerView: UIImageView {

    let PREPARE = 0
    let DROPPING = 1
    let DRAWINGUP = 2
    let CAUGHTF = 3
    var status : Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "hook")
        self.status = PREPARE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateMove(){
        if (self.status == DROPPING) {
            
                self.center = CGPointMake(self.center.x, self.center.y + 10 )
            if (self.frame.origin.y  + self.frame.height > 480){
                self.status = DRAWINGUP
            }
        }else if (self.status == DRAWINGUP){
            
            self.center = CGPointMake(self.center.x , self.center.y - 20)
            if(self.frame.origin.y + self.frame.size.height < 0){
                
                self.status = PREPARE
            }
            
        }else if (self.status == CAUGHTF){
            
            self.center = CGPointMake(self.center.x, self.center.y - 5)
            if (self.frame.origin.y + self.frame.height < 0){
                self.status = PREPARE
            }
            
        }
        
    }
    
    
    //---
    func dropDownAtX(_x : Int){
        if (self.status == PREPARE){
            self.center  = CGPointMake(CGFloat(_x), self.center.y)
            self.status = DROPPING
        }
        
    }
    
  

}

//
//  GameManager.swift
//  GameFish1
//
//  Created by ReasonAmu on 7/30/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class GameManager: NSObject {
    
    var fishView : NSMutableArray?
    var hookView : HookerView?
    
    
    override init() {
        self.fishView = NSMutableArray()
        self.hookView = HookerView(frame: CGRectMake(0,-490,20,490))
        
    }
    
    func addFish(viewController:UIViewController , width :Int){
        
        let fishView  =   FishView(frame: CGRectMake(0,0,40,30))
        fishView.generateFish(width)
        self.fishView?.addObject(fishView)
        viewController.view.addSubview(fishView)
    }
    
    
    func bite (fishView: FishView ){
        
        if(fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWINGUP){
            
            fishView.caught()
            print("Test \(fishView.frame.height)")
            fishView.center = CGPointMake(self.hookView!.center.x , self.hookView!.frame.origin.y + self.hookView!.frame.height   + fishView.frame.width / 2 )
            self.hookView?.status = self.hookView?.CAUGHTF
        }
        
    }
    
    func updateMove(){
        
        self.hookView?.updateMove()
        for fishView in self.fishView!{
            
            fishView.updateMove()
            
        if(CGRectContainsPoint(fishView.frame, CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + (self.hookView?.frame.height)! + fishView.frame.width/2 ))){
            
            bite(fishView as! FishView)
            }
        }
    }
    
    func dropHookerAtX(_x : Int) {
        
        self.hookView?.dropDownAtX(_x)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

//
//  ViewController.swift
//  GameFish1
//
//  Created by ReasonAmu on 7/30/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameManager: GameManager?
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let bg = UIImage(named: "ocean.png")
        self.view.backgroundColor = UIColor(patternImage: bg!)
       
        //-- 
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView!)!)
        self.gameManager?.addFish(self, width: Int(self.view.bounds.size.width))
        
        let tapClick = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(_:)))
        self.view.addGestureRecognizer(tapClick)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self.gameManager!, selector: #selector(GameManager.updateMove), userInfo: nil, repeats: true)
        
    }

    func onTap(onTapGesture : UITapGestureRecognizer){
        
        let tapPoint = onTapGesture.locationInView(self.view)
        self.gameManager?.dropHookerAtX(Int(tapPoint.x))
        
    }


    @IBAction func btnAdd(sender: AnyObject) {
        
        
        self.gameManager?.addFish(self, width: Int(self.view.bounds.width))
    }
    
    
    @IBAction func btn_Reset(sender: AnyObject) {
        self.gameManager?.fishView?.removeAllObjects()
        
        //-- remove   superview on view cha
        for object in self.view.subviews
        {
            
            if (object .isKindOfClass(FishView)){
                
                object.removeFromSuperview()
            }
        }
        self.gameManager?.addFish(self, width: Int(self.view.bounds.width))
        self.gameManager?.addFish(self, width: Int(self.view.bounds.width))
    }
    
}


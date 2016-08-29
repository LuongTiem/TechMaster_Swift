//
//  Game.swift
//  AppMerryChristmas
//
//  Created by ReasonAmu on 7/29/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class Game: UIViewController, UIGestureRecognizerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        let swipeBack  = UISwipeGestureRecognizer(target: self, action: #selector(Game.backController(_:)))
        
        swipeBack.direction = .Right
        self.view.addGestureRecognizer(swipeBack)
        
        let panEdge  = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(Game.onPanEdge(_:)))
             panEdge.edges = .Right
            panEdge.delegate = self
        self.view.addGestureRecognizer(panEdge)
    }

    

    func onPanEdge(panEdge : UIScreenEdgePanGestureRecognizer){
        if panEdge.state == .Began || panEdge.state == .Changed {
             print("Began || changed")
            self.navigationController?.pushViewController((self.storyboard?.instantiateViewControllerWithIdentifier("test") as! Test), animated: true)
        }
        
    }

    func backController(swipeLeft : UISwipeGestureRecognizer){
        //self.navigationController?.navigationBarHidden = false
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
}

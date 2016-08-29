//
//  ViewController.swift
//  AppMerryChristmas
//
//  Created by ReasonAmu on 7/28/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.view.backgroundColor = UIColor(red: 17/255, green: 237/255, blue: 252/255, alpha: 1)
        //--
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
        //--
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.onSwipe(_:)))
        swipeLeft.direction = .Left
        self.view.addGestureRecognizer(swipeLeft)
        //-- 
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.onSwipe(_:)))
        swipeRight.direction = .Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("run viewdiApper ")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true //--
        print("run WillAppear")
    }
    

    func onTap(tapGesture : UITapGestureRecognizer){
        
        
        let point = tapGesture.locationInView(self.view)
        let addBall = UIImageView(image: UIImage(named: "ball"))
        addBall.bounds.size = CGSizeMake(15, 15)
        addBall.contentMode = .ScaleAspectFit
        addBall.center = point
        self.view.addSubview(addBall)
        
        
    }
    
    func onSwipe(swipe: UISwipeGestureRecognizer){
        if(swipe.direction == .Right){
            
            print("vuot phai")
            
        }
        if (swipe.direction == .Left) {
            print("vuot trai")
            self.navigationController?.pushViewController((self.storyboard?.instantiateViewControllerWithIdentifier("game") as! Game), animated: true)
        }
        
    }
    
    
    
  

}


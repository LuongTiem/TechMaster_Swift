//
//  Test.swift
//  AppMerryChristmas
//
//  Created by ReasonAmu on 7/29/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class Test: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let swipeBack  = UISwipeGestureRecognizer(target: self, action: #selector(Test.backController(_:)))
        
        swipeBack.direction = .Right
        self.view.addGestureRecognizer(swipeBack)
        
        print(navigationController?.topViewController)
        
        
        //-- long
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(Test.onLongGesture(_:)))
        self.view.addGestureRecognizer(longGesture)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    func onLongGesture(longGesture : UILongPressGestureRecognizer){
        
        if longGesture.state == .Began{
            
            let alertController = UIAlertController(title: "", message: "Nhan giu lau tai 1 diem ", preferredStyle: .Alert)
            let actionOk = UIAlertAction(title: "OK", style: .Cancel) { (test) in
                print("______________________")
            }
            actionOk.setValue(UIColor.redColor(), forKey: "titleTextColor")
            alertController.addAction(actionOk)
            self.presentViewController(alertController, animated: true, completion: nil)
        
        }
        
        
      
        
    }

    
    func backController(swipeLeft : UISwipeGestureRecognizer){
       // self.navigationController?.navigationBarHidden = false
       // self.navigationController?.popToRootViewControllerAnimated(true)
        
        self.navigationController?.popViewControllerAnimated(true)
        
    
        
    }
}

//
//  MainController.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/25/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
  
    func Push(gesture : UITapGestureRecognizer) {
                let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("test")
                detailVC?.modalPresentationStyle = .OverCurrentContext //-- day tu duoi len
                self.presentViewController(detailVC!, animated: true) {
        
                    print("Show Full Detail")
                }
    }
    
    
}

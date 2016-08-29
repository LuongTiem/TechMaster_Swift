//
//  Item.swift
//  AppMerryChristmas
//
//  Created by ReasonAmu on 7/29/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setUp()
        
    }
    
    func setUp(){
        //-- set da cham
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        
        //-- keo
        let panGesture  = UIPanGestureRecognizer(target: self, action: #selector(Item.onPan(_:)))
        self.addGestureRecognizer(panGesture)
        //--
        let pinchGesture = UIPinchGestureRecognizer (target: self, action: #selector(Item.onPinchImage(_:)))
        self.addGestureRecognizer(pinchGesture)
        //-- 
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(Item.onRotateImg(_:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
        
    }
    
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
    func onPan(panGesture : UIPanGestureRecognizer){
        
        if (panGesture.state == .Began || panGesture.state == .Changed) {
            
            let point = panGesture.locationInView(self.superview)
            self.center = point
            
        }
    }
    
    func onPinchImage(pinchGesture : UIPinchGestureRecognizer){
        
        if let viewImg = pinchGesture.view {
            viewImg.transform = CGAffineTransformScale(viewImg.transform, pinchGesture.scale, pinchGesture.scale)
            pinchGesture.scale = 1
        }
    }
    
    
    func onRotateImg(rotateGesture : UIRotationGestureRecognizer){
        
        if let rotateImg = rotateGesture.view {
            rotateImg.transform = CGAffineTransformRotate(rotateImg.transform, rotateGesture.rotation)
            rotateGesture.rotation = 0 //-- goc quay 0
        }
    }
    
}


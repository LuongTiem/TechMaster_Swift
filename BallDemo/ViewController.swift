//
//  ViewController.swift
//  BallDemo
//
//  Created by ReasonAmu on 7/27/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = NSTimer()
    var radians = CGFloat()
    var ballRadian = CGFloat()
    var ball = UIImageView()
    var checkBien = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.015, target: self, selector: #selector(ViewController.rollBall), userInfo: nil, repeats: true)
        checkBien = true
        addBall()
        rollBall()
    }

 
    

    
    func addBall(){
        let viewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadian = 32
        ball.center = CGPointMake(ballRadian , viewSize.height/2)
        self.view.addSubview(ball)
        
    }
    
    func rollBall(){
        
        let maxX = self.view.bounds.size.width
        print(ball.center.x)
        print(maxX)
        
        
        if(checkBien){
            
            leftToRightTop()
            
        }else {
            
            rightToLeftTop()
            
        }
    }
    

    func leftToRight(){
        
        let detal: CGFloat = 0.1
        radians = radians + detal
        ball.transform = CGAffineTransformMakeRotation(radians)
        ball.center = CGPointMake(ball.center.x   + radians * detal, ball.center.y)
        
        if (ball.center.x > self.view.bounds.size.width - ballRadian) {
            checkBien = !checkBien
            radians = -0.2
        }
    }
    
    func rightToLeft(){
        let detal: CGFloat = -0.1
        radians = radians + detal
        ball.transform = CGAffineTransformMakeRotation(radians)
        
        //-- custom 
        ball.center.y = self.view.bounds.size.width
        ball.center = CGPointMake(ball.center.x   - radians * detal, ball.center.y)
        
        if(ball.center.x < ballRadian){
            checkBien = true
            radians = 0.2
        }
    }
   
    
    func leftToRightTop(){
        
        let detal: CGFloat = 0.1
        radians = radians + detal
        ball.transform = CGAffineTransformMakeRotation(radians)
        ball.center = CGPointMake(ball.center.x   + radians * detal, ball.center.y - radians * detal)
        
        if (ball.center.x > self.view.bounds.size.width - ballRadian) {
            checkBien = !checkBien
            radians = -0.2
        }
    }

    func rightToLeftTop(){
        let detal: CGFloat = -0.1
        radians = radians + detal
        ball.transform = CGAffineTransformMakeRotation(radians)
        
        //-- custom
        let bienY:CGFloat  = self.view.bounds.size.width
        ball.center = CGPointMake(ball.center.x   - radians * detal, bienY)
        
        if(ball.center.x < ballRadian){
            checkBien = true
            radians = 0.2
        }
    }
    

}


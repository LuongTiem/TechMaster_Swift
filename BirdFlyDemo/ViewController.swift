//
//  ViewController.swift
//  BirdFlyDemo
//
//  Created by ReasonAmu on 7/27/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit
import AVFoundation
enum Direct {
    case Up
    case Down
    case location_First
    case Right
}
class ViewController: UIViewController {
    var bird  = UIImageView()
    var audio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackground()
        addBird()
        flyUpAndDown()
        playSong(true)
        
        
    }

    
    func addBackground(){
        
        let backgroundView = UIImageView(image: UIImage(named:"jungle.jpg" ))
            backgroundView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
            backgroundView.contentMode = .ScaleAspectFill
        self.view.addSubview(backgroundView)
        
    }
    
    func addBird(){
        
        bird = UIImageView(frame: CGRectMake(0, 0, 110, 68))
        bird.animationImages = [UIImage(named : "bird0.png")!,
                                UIImage(named : "bird1.png")!,
                                UIImage(named : "bird2.png")!,
                                UIImage(named : "bird3.png")!,
                                UIImage(named : "bird4.png")!,
                                UIImage(named : "bird5.png")!]
        
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        
        self.view.addSubview(bird)
    }
    
    func flyUpAndDown(){
        
        UIView.animateWithDuration(4, animations: {
            
                    self.fly(.Down)
            }) { (finished) in
                //-- hoat canh?
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1),CGAffineTransformMakeRotation(0))
                
        UIView.animateWithDuration(4, animations: {
                    
                    self.fly(.Right)
                    
                    }, completion: { (finished) in
                        
                    self.bird.transform  = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, -1), CGAffineTransformMakeRotation(90))
                      
        UIView.animateWithDuration(4, animations: {
                                
                    self.fly(.Up)
                            
                            }, completion: { (finished) in
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(45))
                                
        UIView.animateWithDuration(4, animations: {
                                    
                    self.fly(.location_First)
                                    }, completion: { (back) in
                                    
                    self.bird.transform = CGAffineTransformIdentity
                    self.flyUpAndDown()
                                })
                        })
                })
                
                //--
        }
    }
    



    func fly(direct : Direct){
        switch direct {
        case .Down:
            
            self.bird.center = CGPointMake(self.view.bounds.size.width - 30 , self.view.bounds.height - 30 )
            break
        case .Right:
             self.bird.center = CGPointMake(30, self.view.bounds.size.height - 30)
            break
        case .Up:
            self.bird.center = CGPointMake(self.view.bounds.size.width, 30)
            break
        case .location_First:
            self.bird.center = CGPointMake(30, 30)
            break

        }
        
        
    }
    
    func playSong(bool: Bool){
        
        let filePath  = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audio = try! AVAudioPlayer.init(contentsOfURL: url)
        audio.prepareToPlay()
        if(bool){
            audio.play()
        }else{
            audio.stop()
        }
        
        
    }

}


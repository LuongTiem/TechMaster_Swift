//
//  DetailVC.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/22/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit
import AVFoundation

class DetailVC: AudioViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var leftTime: UILabel!
    @IBOutlet weak var rightTime: UILabel!
    @IBOutlet weak var sld_Audio_OutLet: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDissmissView(_:)))
        swipeDown.direction = .Down
        self.view.addGestureRecognizer(swipeDown)
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
                let tapSliderGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapSliderAudio))
        
                tapSliderGestureRecognizer.delegate = self
                tapSliderGestureRecognizer.numberOfTouchesRequired = 1
                self.sld_Audio_OutLet.addGestureRecognizer(tapSliderGestureRecognizer)
    
       
        
    }
    @IBAction func slder_Duration(sender : UISlider){
        
        audioPlayer.action_Sld_Duration(sender.value)
        
        if(sld_Audio_OutLet.highlighted.boolValue == true) {
            sld_Audio_OutLet.thumbTintColor = UIColor.greenColor()
        }
        
        print(sld_Audio_OutLet.highlighted.boolValue)
        
    }
    
    
    func tapSliderAudio(gesture : UITapGestureRecognizer){
      
     
        if(sld_Audio_OutLet.highlighted == true) {
            
            print("KEOOOOOOO")
            
        }else{
            print("Tap")
            let pointTap:CGPoint = gesture.locationInView(self.view)
            let positionOfSlider:CGPoint = sld_Audio_OutLet.frame.origin
            let widthOfSlider: CGFloat = sld_Audio_OutLet.frame.size.width
            let newValue = ((pointTap.x  - positionOfSlider.x) * CGFloat(sld_Audio_OutLet.maximumValue) / widthOfSlider)
            let seekTime = Float(newValue) * audioPlayer.duration
            let time = CMTimeMake(Int64(seekTime), 1)
            audioPlayer.currentTime = Float(CMTimeGetSeconds(time))
            audioPlayer.playMP3.seekToTime(time) { (finish) in
                self.sld_Audio_OutLet.setValue(Float(newValue), animated: true)
            }
            
        }
        
       
        print(sld_Audio_OutLet.highlighted.boolValue)
        
    }

    
    func update(){
        
        let min = Int(floor(audioPlayer.currentTime / 60))
        let s = Int(round(audioPlayer.currentTime - Float(min) * 60))
        
        if sld_Audio_OutLet.highlighted.boolValue == false {
            sld_Audio_OutLet.thumbTintColor = .None
        }
        
        if(audioPlayer.duration > 0){
            
            let mduration  = Int(floor(audioPlayer.duration / 60))
            let sduration = Int(round(audioPlayer.duration - Float(mduration)*60))
            
            rightTime.text = String(format: "%02d", mduration ) + ":" + String(format: "%02d",sduration)
            leftTime.text = String(format: "%02d", min ) + ":" + String(format: "%02d",s)
            
            sld_Audio_OutLet.setValue(Float(audioPlayer.currentTime / audioPlayer.duration), animated: true)
            
        }
        
        
  
       
    }
    


    
    @IBAction func btnActionDissmiss(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    //-- gesture up
    func swipeDissmissView(gesture : UISwipeGestureRecognizer){
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    
    
}



//
//  AudioViewController.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/27/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit


class AudioViewController: MainController {
    
    let audioPlayer = AudioPlayer.shareInstance
    var radian = CGFloat()
    @IBOutlet weak var btn_Play: UIButton!
    @IBOutlet weak var album: UIImageView!
    @IBOutlet weak var artistSong: UILabel!
    @IBOutlet weak var titleSong: UILabel!
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadDisplay()
    }
    
    
    func loadDisplay(){
        
        titleSong.text = audioPlayer.titleSong
        artistSong.text = audioPlayer.artistSong
        addThumImgForButton()
        Album()
    }
    
    
    func Album(){
        let dental: CGFloat = 0.1
        radian = radian + dental
        album.layer.cornerRadius = self.album.bounds.width/2
        album.layer.masksToBounds = true
        album.transform = CGAffineTransformMakeRotation(radian)
        album.image = audioPlayer.img
        
    }
    
    
    func addThumImgForButton(){
        
        if(audioPlayer.playing == true){
            self.btn_Play.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
        }else{
            self.btn_Play.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
        }
    }
    
    
    
    
    
    //-- Button Action
    @IBAction func repeatSong(sender : UISwitch){
        
        audioPlayer.btn_Repeat(sender.on.boolValue)
        print(audioPlayer.repeating)
    }
    
    
    
    
    @IBAction func  action_PlayPause(sender : AnyObject){
        
        audioPlayer.btn_Playing()
        addThumImgForButton()
    }
    
    
    


    
    
    @IBAction func slder_Volume(sender : UISlider){
        audioPlayer.action_Sld_Volume(sender.value)
    }
    
    
    @IBAction func prevButton(sender :AnyObject){
        print("Mang\(audioPlayer.listAlbum.count)")
        let index = audioPlayer.currentState["index"]!
        
        if (index > 0) {
            let prev = index - 1
            audioPlayer.loadSongWithIndex(prev)
            audioPlayer.currentState["index"] = prev
            audioPlayer.setupAudio()
            loadDisplay()
            
        }
        
        
        
    }
    
    @IBAction func nextButton(sender : AnyObject){
        print("Mang\(audioPlayer.listAlbum.count)")
        let index = AudioPlayer.shareInstance.currentState["index"]!
        
        if(index < audioPlayer.listAlbum.count - 1){
            let next = index + 1
            audioPlayer.loadSongWithIndex(next)
            audioPlayer.currentState["index"] = next
            audioPlayer.setupAudio()
            loadDisplay()
            
        }
        
    }
    
    
    
    
    
    
    
    
}

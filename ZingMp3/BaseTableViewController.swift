//
//  BasePlayView.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/22/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit
import AVFoundation
let kDOCUMENT_DIRECTORY_PATH = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true).first


class BaseTableViewController: AudioViewController,UITableViewDelegate,UITableViewDataSource {

    
    var listSongs = [Song]()
    var timer = NSTimer()
    var checkAddObserverAudio: Bool = false
    @IBOutlet weak var panVerificationUIView: ClickableUIView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.btn_Play.enabled = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(setupObserverAudio), name: "setupObserverAudio", object: nil)
        
    }
    
    //---
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
      //  listSongs.removeAll()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(Push(_:))) //-- khoi tao gesture
        self.panVerificationUIView.addGestureRecognizer(tap) //-- add gesture vao trong view can xu ly
        setupObserverAudio()
        

    
       
    }
    
    func timeUpdate(){
        //-- CMTime time , timeScale => s = time/ timeScale
        
      //-- lay thong so thoi luong bai hat
        audioPlayer.duration = Float((audioPlayer.playMP3.currentItem?.duration.seconds)!)
        
    //    print("Tong thoi gian bai hat : \(audioPlayer.duration)s")
        
    //-- thoi gian dang chay
        audioPlayer.currentTime = Float(audioPlayer.playMP3.currentTime().value) / Float(audioPlayer.playMP3.currentTime().timescale)
        
       
        Album()
        loadDisplay()
        
    }
    
    
    func setupObserverAudio(){
        if(audioPlayer.playing && !checkAddObserverAudio){
            checkAddObserverAudio = true
            _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats: true)
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(playRepeatSong), name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        loadDisplay()
        
    }
    
    func playRepeatSong(notification : NSNotification){
        
        if(audioPlayer.repeating == true){
            audioPlayer.playMP3.seekToTime(kCMTimeZero)
            audioPlayer.playMP3.play()
        }
    }
    
    //-- tableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSongs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.imageView?.image = listSongs[indexPath.row].thumbnail
        cell.textLabel?.text = listSongs[indexPath.row].title
        return cell
    }
    
    
    
}

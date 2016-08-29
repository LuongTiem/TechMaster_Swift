//
//  AudioPlayer.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/23/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit
import AVFoundation
enum StateSong
{
    case Online
    case Offline
}
class AudioPlayer: NSObject {
    
    class var shareInstance : AudioPlayer {
        struct Static {
            static var onceToken  : dispatch_once_t = 0
            static var instance : AudioPlayer? = nil
        }
        
        dispatch_once(&Static.onceToken){
            
            Static.instance = AudioPlayer()
        }
        return Static.instance!
    }
    
    var pathString = ""
    var repeating:Bool = false
    var playing: Bool = false
    var duration = Float()
    var currentTime = Float()
    var titleSong = ""
    var artistSong = ""
    var img:UIImage!
    var playMP3 = AVPlayer()
    var timeRunningAudio :String!//-- test
    var timeTotalTimeAudio: String! // -- test
    var listAlbum:[Song] = [Song]()
    
    var currentState = ["state":StateSong.Offline.hashValue, "index": 0]
    
    func setupAudio(){
        var url = NSURL()
        
        
        
        
        if let checkURL = NSURL(string: pathString){
            
            url = checkURL
            
        }else {
            
            url = NSURL(fileURLWithPath: pathString)
        }
        let playItem = AVPlayerItem(URL: url)
        playMP3  = AVPlayer(playerItem: playItem)
        playMP3.rate = 1.0
        playMP3.volume = 0.5
        playMP3.play()
        playing = true
        repeating = true

   }
    
    //-- Action Repeat
    func btn_Repeat(repeatSong : Bool){
        
         
        if (repeating == true ){
            repeating = false
            
        }else{
            repeating = true
        }
        
        

    }
    
    //-- Action Playing
    func btn_Playing(){
        if (playing == true) {
            playMP3.pause()
            playing = false
        }else{
            playMP3.play()
            playing = true
        }
        
    }
    
    //-- Action Slider
    
    func action_Sld_Duration(value : CFloat){
        

        
        let seekTime = value * duration
        let time = CMTimeMake(Int64(seekTime), 1)
        currentTime = Float(CMTimeGetSeconds(time))
        playMP3.seekToTime(time) { (finish) in
        }
        
    }
    
    //-- Action volume
    
    func action_Sld_Volume(value : CFloat){
        
        playMP3.volume = value
        
    }
    
    func loadSongWithIndex(index: Int)
    {
        var pathSong = ""
        if (listAlbum[index].sourceLocal != ""){
            
            pathSong = listAlbum[index].sourceLocal
            
        }else {
            
            pathSong = listAlbum[index].sourceOnline
            
        }
        
        pathString = pathSong
        titleSong = listAlbum[index].title
        artistSong = listAlbum[index].artistName
        img = listAlbum[index].thumbnail
        setupAudio()
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("setupObserverAudio", object: nil)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

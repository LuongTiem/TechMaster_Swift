//
//  TabMusicLocal.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/22/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class TabMusicLocal: BaseTableViewController {
    
    @IBOutlet weak var tblLocal: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblLocal.delegate = self
        tblLocal.dataSource = self
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        listSongs.removeAll()
        getDataLocal()
        
        
    }
    
    
    
    func getDataLocal (){

        if let dir = kDOCUMENT_DIRECTORY_PATH {
            
            do {
                
                let folders  = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(dir)
                for folder  in folders{
                    if (folder != ".DS_Store"){
                        let info = NSDictionary(contentsOfFile: dir + "/" + folder + "/" + "info.plist")
                        let title  = info!["title"] as! String
                        let artistName = info!["artistName"] as! String
                        let thumbnailPath = info!["localThumbnail"] as! String
                        let localThumnail = dir + thumbnailPath
                        let sourceLocal = dir + "/" + title + "/" + "\(title).mp3"
                        
                        let currentSongLocal = Song(title: title, artistName: artistName, localThumbnail: localThumnail, sourceLocal: sourceLocal)
                        //-- add
                        listSongs.append(currentSongLocal)
                        
                        self.tblLocal.reloadData()
                    }
                }
               // AudioPlayer.shareInstance.listAlbum = listSongs
            }
            catch let err as NSError{
                print(err.localizedDescription)
            }
        }
        
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tblLocal.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = listSongs[indexPath.row].title
        cell.imageView?.image = listSongs[indexPath.row].thumbnail
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if (editingStyle == .Delete){
            
            removeSongAtIndex(indexPath.row)
            print("Delete")
            
        }
        
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    
    
    //----
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var state = AudioPlayer.shareInstance.currentState["state"]
        
        state = StateSong.Offline.hashValue //-- touchChange row local
        
        
        if (state == StateSong.Offline.hashValue)
        {
            AudioPlayer.shareInstance.listAlbum = listSongs
            print("Vao list Offline")
        }
        
        AudioPlayer.shareInstance.currentState = ["state": StateSong.Offline.hashValue , "index":indexPath.row]
        AudioPlayer.shareInstance.loadSongWithIndex(indexPath.row)
        AudioPlayer.shareInstance.setupAudio()
        
    }
    

    
    
    func removeSongAtIndex(index :Int){
        if let dir = kDOCUMENT_DIRECTORY_PATH{
            do {
                
                let path = dir + "/\(listSongs[index].title)"
                try NSFileManager.defaultManager().removeItemAtPath(path)
                listSongs.removeAtIndex(index)
                self.tblLocal.reloadData()
                
            }catch let err as NSError{
                print(err.localizedDescription)
            }
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if(audioPlayer.currentState["state"] == StateSong.Offline.hashValue){
            
            let indexRow = audioPlayer.currentState["index"]
            let IndexPath = NSIndexPath(forRow: indexRow!, inSection: 0)
            self.tblLocal.selectRowAtIndexPath(IndexPath, animated: true, scrollPosition: .None)
            
            
        }else{
            
            return
            
        }
    
        
            self.updateFocusIfNeeded()
            
        
        
        
    }
    
    
    
    
    
    
}

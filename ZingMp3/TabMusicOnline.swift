//
//  TabMusicOnline.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/22/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class TabMusicOnline: BaseTableViewController {
    
    @IBOutlet weak var tbl: UITableView!
    func getDataHTML(){
        
        
        //--
        let url = NSURL(string: "http://mp3.zing.vn/bang-xep-hang/bai-hat-Viet-Nam/IWZ9Z08I.html")
        let data = NSData(contentsOfURL: url!)
        //        print(String(data: data!, encoding: NSUTF8StringEncoding))
        
        
        let loadHTML = TFHpple(HTMLData: data!)
        if let elments =  loadHTML.searchWithXPathQuery("//h3[@class='title-item']/a") as? [TFHppleElement]{
            var count = 0
            for element in elments {
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                    
                    
                    let id = self.getIDSong(element.objectForKey("href"))
                    let string = "http://api.mp3.zing.vn/api/mobile/song/getsonginfo?keycode=fafd463e2131914934b73310aa34a23f&requestdata={\"id\":\"\(id)\"}".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
                    let url = NSURL(string: string!)
                    var stringData = ""
                    //-- bat loi
                    do {
                        
                        stringData = try String(contentsOfURL: url!) //-- return JSon
                    }
                    catch let error as NSError{
                        print(error)
                    }
                    
                    // print(stringData)
                    
                    //-- convert JSon
                    let json = self.convertJSonToDictionary(stringData)
                    
                    //-- addSong
                    count = count + 1
                    
                    if (json != nil){
                        self.addSongToList(json!)
                        
                    }
//                    if (count == elments.count)
//                    {
//                        AudioPlayer.shareInstance.listAlbum = self.listSongs
//                    }
                    
                })
                
            }
            
        }
        
    }
    
    
    
    //-- converJSon ->> Dictionary
     func convertJSonToDictionary(string : String) -> [String: AnyObject]?{
        
        if let data  = string.dataUsingEncoding(NSUTF8StringEncoding){
            do {
                
                let json  = try  NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String: AnyObject]
                
                return json
            }
            catch let error as NSError{
                print(error)
            }
            
        }
        return nil
    }
    
    //-- add song vao listsong
    
     func addSongToList(json : [String : AnyObject ]){
        let title = json["title"] as! String
        let artistName = json["artist"] as! String
        let thumbnail = json["thumbnail"] as! String
        let source = json["source"]!["128"] as! String
        
        
        let currentSong = Song(title: title, artistName: artistName, thumbnail: thumbnail, sourceOnline: source)
        listSongs.append(currentSong)
        
        updateViewTableView()
        
        
        
        
    }
    
    //-- get ID cua bai hat
     func  getIDSong(path : NSString) -> String{
        let id = (path.lastPathComponent as NSString).stringByDeletingPathExtension
        //print(id)
        
        return id
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataHTML()
        self.tbl.delegate =  self
        self.tbl.dataSource = self
    }
    
    
    //-- update giao dien
    func updateViewTableView(){
        dispatch_async(dispatch_get_main_queue()) {
            self.tbl.reloadData()
        }
    }
    
    //UITabaleview
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSongs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tbl.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.imageView?.image = listSongs[indexPath.row].thumbnail
        cell.textLabel?.text = listSongs[indexPath.row].title
        return cell
    }
    
    //-- selectionRow 
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var state = AudioPlayer.shareInstance.currentState["state"]
        
        state = StateSong.Online.hashValue ///-- touchChange row online
        
        if (state == StateSong.Online.hashValue)
        {
            AudioPlayer.shareInstance.listAlbum = listSongs
             print("Vao list Online")
        }
        AudioPlayer.shareInstance.currentState = ["state":StateSong.Online.hashValue, "index":indexPath.row]
        AudioPlayer.shareInstance.loadSongWithIndex(indexPath.row)
        
       
        
      
    }
    
    //-- tuy chinh edit
     func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let dowloadSong128  = UITableViewRowAction(style: .Default, title: "Download") { (action, index) in
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                
                if (self.listSongs[indexPath.row].kCheckDownload){
                    
                  self.downLoadSong(indexPath.row)
                    print("True")
                }else{
                    print("False")
                    return
                }
                
            })
            self.updateViewTableView()
            
        }
        return[dowloadSong128]
    }
    
    
    //-- download SOng
    func downLoadSong(index :Int){
        
        listSongs[index].kCheckDownload = false
        let dataSong = NSData(contentsOfURL: NSURL(string:listSongs[index].sourceOnline )!)
        
        if let dir = kDOCUMENT_DIRECTORY_PATH {
                //-- write 
            let pathToWriteSong = "\(dir)/\(listSongs[index].title)"
            do{
                try NSFileManager.defaultManager().createDirectoryAtPath(pathToWriteSong, withIntermediateDirectories: false, attributes: nil)
                
            }catch let err as NSError{
                
                print(err.localizedDescription)
            }
            
           //-- 
            self.writeDataToPath(dataSong!,path: "\(pathToWriteSong)/\(listSongs[index].title).mp3")
            
            
            //-- content bai hat
            self.writeInfoSong(listSongs[index], path : pathToWriteSong)

        }
        
        
    }
    
    func writeDataToPath(data : NSObject , path:String ){
        if let dataToWriteData = data as? NSData{
            
        dataToWriteData.writeToFile(path, atomically: true)
            
        }else if let dataInfo_plist = data as? NSDictionary {
            
            dataInfo_plist.writeToFile(path, atomically: true)
        }
    }
    
    func writeInfoSong(song :Song , path :String){
        let dicData = NSMutableDictionary()
        dicData.setValue(song.title, forKey: "title")
        dicData.setValue(song.artistName, forKey: "artistName")
        dicData.setValue("/\(song.title)/thumbnail.png", forKey: "localThumbnail")
        dicData.setValue(song.sourceOnline, forKey: "sourceOnline")
        //-- write file
        self.writeDataToPath(dicData, path: "\(path)/info.plist")
        //-- write thumb
        let dataThumbnail = NSData(data: UIImagePNGRepresentation(song.thumbnail)!)
        writeDataToPath(dataThumbnail, path:  "\(path)/thumbnail.png")
    }
    
    
 
    
    override func viewWillLayoutSubviews() {
        
        if (audioPlayer.currentState["state"] == StateSong.Online.hashValue){
            
            let indexRow = audioPlayer.currentState["index"]
            let indexPath = NSIndexPath(forRow: indexRow!, inSection: 0)
            self.tbl.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .None)
            
        }else{
            return
        }
        
                self.updateFocusIfNeeded()
              
        

    }
    
    
    
    
    
    
    
    
    
    
    
}

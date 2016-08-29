//
//  DetailVC.swift
//  TableViewDemo
//
//  Created by ReasonAmu on 8/9/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tbl: UITableView!
    
    var stringTitle: String!
    var dictData :NSDictionary!
    var arrayKeys: NSArray!
    let cellKey:String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tbl.delegate = self
        self.tbl.dataSource = self
        self.tbl.registerClass((UITableViewCell.self), forCellReuseIdentifier: cellKey)
        self.title = stringTitle

       createDataWithName(stringTitle)
    }
    
    
    func createDataWithName(title : String){
        
        var path:String = ""
        
        if(title == "Fruits"){
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: ".plist")!
            
        }else if (title == "Animals"){
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: ".plist")!
            
        }
        
        dictData = NSDictionary(contentsOfFile: path)
        arrayKeys = dictData.allKeys
        arrayKeys = arrayKeys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellKey, forIndexPath: indexPath)
        let key = arrayKeys[indexPath.row] as? String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named:"\(dictData[key!]!)")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let value = arrayKeys[indexPath.row] as! String
        alertview("Thong Bao", titleActionCancel: "Cancel", titleActionOK: "OK", indexPath: indexPath.row, value: value)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 75
    }
    
    
    func alertview(title : String, titleActionCancel : String, titleActionOK:String,indexPath : Int , value: String){
        let message = "IndexPath : \(indexPath)" + "  Value : \(value)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let acitonCancel = UIAlertAction(title: titleActionCancel, style: .Cancel, handler: nil)
        let actionOK = UIAlertAction(title: titleActionOK, style: .Default, handler: nil)
        actionOK.setValue(UIColor.redColor(), forKey: "titleTextColor")
        acitonCancel.setValue(UIColor.yellowColor(), forKey: "titleTextColor")
        alertController.addAction(actionOK)
        alertController.addAction(acitonCancel)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

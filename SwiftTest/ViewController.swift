//
//  ViewController.swift
//  SwiftTest
//
//  Created by ReasonAmu on 7/1/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tbl: UITableView!
    var array :[String] = ["LuongTiem1","Luongtiem2","luongtiem3","swift","object c "]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell  = self.tbl.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
       
        cell.textLabel?.text = "Row" + "\(indexPath.row)";
        return cell;
    }
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
       array.removeAtIndex(indexPath.row)
         tbl.reloadData()
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("ban click vao row " + String(indexPath.row))
       
        
        let  test = UIAlertController(title:"Show alertview ", message: "This is row" + String(indexPath.row),preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(test, animated: true, completion: nil)
        test.addAction(UIAlertAction(title: "OK",style: .Default,handler:nil))
        test.addAction(UIAlertAction(title: "NO",style: .Default,handler: nil))
        print("asdad")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


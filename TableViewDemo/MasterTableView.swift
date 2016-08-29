//
//  ViewController.swift
//  TableViewDemo
//
//  Created by ReasonAmu on 8/9/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class MasterTableView: UIViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tbl: UITableView!
    var dictList  = ["Fruits" : "animals.jpeg","Animals" : "fruits.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }

  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dictList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tbl.dequeueReusableCellWithIdentifier("Cell")!
        //-- lay keys dictonary 
        var arraykeys = Array(dictList.keys)
            cell.textLabel?.text = arraykeys[indexPath.row]
            cell.imageView?.image = UIImage(named: dictList["\(arraykeys[indexPath.row])"]!)
            cell.accessoryType = .DisclosureIndicator
        return cell
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showDetail"){
            
            let detailVC =  segue.destinationViewController as! DetailVC
            let selectRowIndexPath:NSIndexPath = self.tbl.indexPathForSelectedRow!
            let selectedCell:UITableViewCell = self.tbl.cellForRowAtIndexPath(selectRowIndexPath)!
            
            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }
  

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
   

}


//
//  ViewController.swift
//  MonAnNgayTet
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tbl: UITableView!
    var dataManager: DataManager = DataManager.shareInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl.delegate = self
        tbl.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataManager.data.count
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
        let monan = dataManager.data[indexPath.item] as! MonAn
        cell.kCellWidth = self.view.frame.size.width
        cell.addSubViews()
        cell.imageViewCell.image = monan.photo
        cell.nameLabel.text = monan.name
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            //-- detele
            dataManager.data.removeObjectAtIndex(indexPath.item)
            tbl.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            print("Delete")
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Select")
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("detailVC") as! DetailVC
            let dataSendView = dataManager.data[indexPath.item] as! MonAn
            detailVC.dataSend = dataSendView
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


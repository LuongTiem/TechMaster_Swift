//
//  MasterViewController.swift
//  MasterDeailDemo
//
//  Created by ReasonAmu on 8/8/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController,UISplitViewControllerDelegate {
     var arrayCell = [String]()
     var check = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
        
        self.splitViewController?.delegate = self
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertCell))
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetailVC"{
            if let  indexPath = self.tableView.indexPathForSelectedRow {
                
                let detailVC = (segue.destinationViewController as! UINavigationController).topViewController as!   DetailViewController
                guard let cell = self.tableView.cellForRowAtIndexPath(indexPath) else { return}
                
                
                detailVC.cellName = cell.textLabel?.text
            }
        }
    }
    
    func insertCell(){
        
        arrayCell.append("Cell \(arrayCell.count + 1 )")
        let indexPath = NSIndexPath(forItem: arrayCell.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        
    }
   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCell.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

   
        cell.textLabel?.text = arrayCell[indexPath.row]
        return cell
    }
    
    //--
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        check = false
        
    }
    
    //--
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return check
    }
    

    // tra ve true de co the sua ?
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
    
        return true
    }
    

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //-- remove data trong mang ->> delete row trong tableview
            arrayCell.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
           // tableView.reloadData()
        } else if editingStyle == .Insert {

            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

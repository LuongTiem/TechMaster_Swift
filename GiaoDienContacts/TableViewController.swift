//
//  TableViewController.swift
//  GiaoDienContacts
//
//  Created by ReasonAmu on 8/11/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayData:NSMutableArray!
    var dictContacts :NSMutableDictionary!
    var arrKey:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

     
        // self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: Selector())
        self.tableView.sectionIndexBackgroundColor = UIColor.grayColor() //-- background
        self.tableView.sectionIndexColor = UIColor.whiteColor() //-- color [A,B,C,...]
        arrayData = NSMutableArray() //-- khoi tao
        dictContacts = NSMutableDictionary()
        for i in 0..<70 {
            arrayData.addObject(Person())
            let person = arrayData[i] as! Person
            print(person.fullName)
        }
        
        for item in arrayData {
            
            let person = item as! Person
            var firstLetter: String  = (person.firstName as  NSString!).substringToIndex(1) as String
            var arrayForLetter : NSMutableArray!
            
            
            if(dictContacts.valueForKey(firstLetter) != nil){
                arrayForLetter = dictContacts.valueForKey((firstLetter)) as! NSMutableArray
                arrayForLetter.addObject(person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
                
            }else{
                arrayForLetter = NSMutableArray(objects:person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
            
            if firstLetter == "Đ"{
                firstLetter = "D"
            }
            if firstLetter == "Á"{
                firstLetter = "A"
            }
        }
        print(dictContacts)
        
        arrKey = dictContacts.allKeys as! [String]
        arrKey = arrKey.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrKey.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionTitle  = arrKey[section]
        let sectionPersons = dictContacts[sectionTitle as! String]!
        
        return sectionPersons.count
    }

    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let value:String = arrKey[section] as! String
        return value
    }
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
    
        return  arrKey as? [String]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
     
        if (cell == nil){
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        let sectionTitle  = arrKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        
        cell!.textLabel?.text = person.fullName
        cell!.detailTextLabel?.text = "097xxxxx"
        
        return cell!
    }
    
    
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor.grayColor()
        let header:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }

    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailVC()
        
        let sectionTitle = arrKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        let person  = sectionPersons![indexPath.row] as! Person
        detailVC.person = person
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

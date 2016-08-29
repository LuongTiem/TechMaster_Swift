//
//  SendData_NSUserDefaultViewController.swift
//  NSTimerDemo
//
//  Created by ReasonAmu on 7/10/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class SendData_NSUserDefaultViewController: UIViewController {
    
    
    var sendData = NSUserDefaults()
    @IBOutlet weak var lbl_Show: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            sendData = NSUserDefaults()
        
        
        lbl_Show.text = sendData.objectForKey("sendOK") as?  String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

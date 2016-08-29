//
//  ViewController.swift
//  NSTimerDemo
//
//  Created by ReasonAmu on 7/9/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var timer = NSTimer()
    var dem = 0
    
    @IBOutlet weak var txt_Nhap: UITextField!
    @IBOutlet weak var img_Anh: UIImageView!
    @IBOutlet weak var lbl_Timer: UILabel!
    
    
    //--- khai bao bien toan cuc bang NSUserDefault
    var sendData = NSUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendData = NSUserDefaults()
      
    }

    @IBAction func SendData(sender: UIButton) {
        
        
       
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(txt_Nhap.text != nil){
            
            sendData.setObject(txt_Nhap.text!, forKey:"sendOK")
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        NSTimerDemo()
        
    }
    
    @IBAction func btn_Local(sender: AnyObject) {
        
        UIView.animateWithDuration(10, animations: {
            
            self.img_Anh.image = UIImage(named: "anh1.jpg")
            }) { (true) in
                 UIView.animateWithDuration(5, animations: {
                    self.img_Anh.layer.cornerRadius = CGRectGetWidth(self.img_Anh.frame) / 2
                    self.img_Anh.layer.masksToBounds = true
                    self.img_Anh.alpha = 0.7
                 })
                
        }
        
        
    }
    
    @IBAction func btn_Internet(sender: AnyObject) {
        
        let url = NSURL(string: "http://genknews.genkcdn.vn/k:2016/mac1-1468071398450/hackerdanhcap14trieumatkhautucacdiendannoitiengnhuwebhostingtalkmacforums.jpg")
        let nsdata = NSData(contentsOfURL: url!)
        
        img_Anh.image = UIImage(data: nsdata!)
        img_Anh.alpha = 1
        
    }
    
   
  //--- 
    func NSTimerDemo() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("Dem"), userInfo: nil, repeats: true)
    }

    
    func Dem() {
        
        dem += 1
        lbl_Timer.text = String(dem)
        
        if (dem == 10){
            
           // timer.invalidate() //-- Ham Stop Timer
            dem = 0
        }
    }
}


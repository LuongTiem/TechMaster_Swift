//
//  ViewController.swift
//  AppMicrosoftWord
//
//  Created by ReasonAmu on 8/12/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit


class ViewController: UIViewController,OptionDelegate{
    var test1:String!
    var test2:Int!
    @IBOutlet weak var txtview: UITextView!
    var check:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        txtview.textColor = UIColor.blackColor()
        
    
    }
    
    func setColor(colorName: UIColor) {
        txtview.textColor = colorName
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "optionVC" {
            //-- su dung ki~ thuat counpling de truyen du~ lieu
            let optionVC = segue.destinationViewController as! OptionVC
            let size = txtview.font?.pointSize
            let font = txtview.font?.fontName
            let color = txtview.textColor
            let alig = txtview.textAlignment.rawValue
            optionVC.option = OptionFont(size: Int(size!), fontName: font! , color: color!, alignment: alig)
            
            
            //-- su dung ki thuat delegate de doi mau chu~
            optionVC.delegate = self
            
            //-- su dung ki thuat notification
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.alignment(_:)), name: "Alignment", object: nil)
            
            
            //-- using block

            optionVC.setStyle({ (para1,para2) in
                
                if(para2 == "true"){
                    self.check = false
                }
                self.test1 = para1
                
                
            })
            
            
            
        } else{
            
            print("Don't push")
        }
    }
    

    
    
    func alignment(notification : NSNotification){
        
        if let info = notification.userInfo as? Dictionary<String,Int> {
            
            if let value = info["Align"] {
                
                txtview.textAlignment = NSTextAlignment(rawValue: value)!
                print("OK : \(value) " )
            
            }
            
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //-- su dung singleton
        
        let option = OptionFont.shareInstance
        if let sizeN = option.size {
            if let font = option.fontName{
                txtview.font = UIFont(name: font, size: CGFloat(sizeN))
                test2 = sizeN
            }
            
            if (test1 == "Bold"){
                print("Bold")
                
                self.txtview.font = UIFont.boldSystemFontOfSize(CGFloat(test2))
                
            }
            if (test1 == "Italic"){
                
                self.txtview.font = UIFont.italicSystemFontOfSize(CGFloat(test2))
                
            }
            if (test1 == "UnderLine"){
                
                let styleUnderline  = [NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue]
                let test = NSAttributedString(string: self.txtview.text, attributes: styleUnderline)
                self.txtview.attributedText = test
            }

        }
       
    
        
    }
    
   

}


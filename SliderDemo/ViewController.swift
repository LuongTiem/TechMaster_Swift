//
//  ViewController.swift
//  SliderDemo
//
//  Created by ReasonAmu on 7/18/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
   
    var inputEmail : UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        
    }
    
    @IBAction func ActionSheet(sender: AnyObject) {
        
        AllShowActionSheet("Action Sheet ", message: "Truyen vao voi bool la fasle , mac dinh la true ", bool: false)
        
    }
    
 
 

    @IBAction func btnAction(sender: UIButton) {
        
        AlertViewCustomTextField()
        
       
  
    }
    
    func ActionSheet(){
        
        let alertController = UIAlertController(title: "UIActionSheet", message: "UIActionSheet", preferredStyle: .ActionSheet)
        
        let ok = UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
            print("Ok Button Pressed")
        })
        
        let  delete = UIAlertAction(title: "Delete", style: .Default) { (action) -> Void in
            print("Delete Button Pressed")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            print("Cancel Button Pressed")
        })
        
        cancel.setValue(UIColor.redColor(), forKeyPath: "titleTextColor")  //-- chuyen mau cho nut cancel sang mau do
        // alertController.view.tintColor = UIColor.redColor() //-- chuyen mau chu~ ca view
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        alertController.addAction(delete)
        
        presentViewController(alertController, animated: true, completion: nil)
        
        //  alertController.view.tintColor = UIColor.redColor() //-- chuyen mau chu  view
    }
    
    func AlertViewBasic(){
        
        let alertview = UIAlertController(title: "Thong Bao", message: "Vui long nhap day du thong tin", preferredStyle: UIAlertControllerStyle.Alert)
        let actionView1 = UIAlertAction(title: "Custom", style: .Destructive, handler: nil)
        
        let actionView2 = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let tes = UIAlertAction(title: "GGG", style: .Default, handler: {
            //-- code
            action in  print("Click")
        })
        
        alertview.addAction(actionView2)
        alertview.addAction(actionView1)
        alertview.addAction(tes)
        
         self.presentViewController(alertview, animated: true, completion: nil)
    }
    
   
    
  
    func AlertViewCustomTextField(){
        
        let alertController = UIAlertController(title: "AlertView textfield", message: "Custom textfield on alertview now", preferredStyle: .Alert)
        
        //-- Add textfield 
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Email ..."
            textField.keyboardType = .EmailAddress
          
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField2) in
            textField2.placeholder = "Password..."
            textField2.secureTextEntry = true
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField3) in
            textField3.placeholder = "Password Confimation"
            textField3.secureTextEntry = true
        }
       
   
        
        //-- Add AlertAction
        let actionDefault = UIAlertAction(title: "OK", style: .Default, handler: {action in
            
//        let txtOne = alertController.textFields![0] as UITextField
//        let txtTwo = alertController.textFields![1] as UITextField
//        let txtThree = alertController.textFields![2] as UITextField
            
  

           
            
        
        print("Click Default")})
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) in
            print("Cancel")
        }
        alertController.addAction(actionDefault)
        alertController.addAction(actionCancel)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
  //-- group alert Demo 
    
    
    func AllShowActionSheet(title : String , message : String , bool : Bool){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
        let btnOk = UIAlertAction(title: "OK", style: .Default) { (UIAlertAction) in
            
        }
        let btnDelete = UIAlertAction(title: "Delete ", style: .Destructive) { (UIAlertAction) in
            
        }
        
        let btnCancelFontRed = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) in
            
        }
        
        if(bool){
            alertController.addAction(btnOk)
            alertController.addAction(btnDelete)
            alertController.addAction(btnCancelFontRed)
        }else{
            alertController.addAction(btnCancelFontRed)
            btnCancelFontRed.setValue(UIColor.redColor(), forKey: "titleTextColor")
            alertController.addAction(btnOk)
           
        }
        
        self.presentViewController(alertController, animated: true) {}
        
        
        
        
    }
}


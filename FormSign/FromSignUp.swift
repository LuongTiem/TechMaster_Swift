//
//  FromSignUp.swift
//  FormSign
//
//  Created by ReasonAmu on 7/25/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class FromSignUp: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var PassSignUp: UITextField!

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var linePass: UIView!
    @IBOutlet weak var lineEmail: UIView!
    var userDangKi = NSUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailSignUp.delegate = self
        self.PassSignUp.delegate = self
        
        btnSignUp.backgroundColor = UIColor.clearColor()
        btnSignUp.layer.borderWidth = 1
        btnSignUp.layer.borderColor  = UIColor.whiteColor().CGColor
        btnSignUp.enabled = false
        AddImageInTextFild()
       
      
    }
    
    
    @IBAction func Action_SignUp(sender: UIButton) {
        
        SignUpOK()
        
    }

    
    func AddImageInTextFild(){
        
        let img_Email = UIImageView(image: UIImage(named: "user"))
        img_Email.frame = CGRectMake(0, 0, 40, emailSignUp.frame.height)
        
        emailSignUp.leftView = img_Email
        emailSignUp.leftView?.contentMode = UIViewContentMode.Center
        emailSignUp.leftViewMode  = UITextFieldViewMode.Always
        
        
        let img_Pass = UIImageView(image: UIImage (named: "pass"))
        img_Pass.frame = CGRectMake(0, 0, 40, PassSignUp.frame.height)
        
        PassSignUp.leftView = img_Pass
        PassSignUp.leftView?.contentMode = UIViewContentMode.Center
        PassSignUp.leftViewMode = UITextFieldViewMode.Always
        
        
        //- replace color placehoder textfield
        if let placeHolderEmail = emailSignUp.placeholder {
            emailSignUp.attributedPlaceholder = NSAttributedString(string: placeHolderEmail, attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        }
        if let placeHolderPass = PassSignUp.placeholder {
            PassSignUp.attributedPlaceholder = NSAttributedString(string: placeHolderPass, attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        }
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if(textField == emailSignUp) {
            emailSignUp.leftViewMode = UITextFieldViewMode.Never
            lineEmail.backgroundColor = UIColor.whiteColor()
            return true
        }
        
        if(textField == PassSignUp){
            PassSignUp.leftViewMode = UITextFieldViewMode.Never
            linePass.backgroundColor = UIColor.whiteColor()
            return true
        }
        
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if(textField == emailSignUp){
            emailSignUp.leftViewMode = UITextFieldViewMode.Always
            lineEmail.backgroundColor = UIColor.lightGrayColor()
        }
        if(textField == PassSignUp){
            PassSignUp.leftViewMode = UITextFieldViewMode.Always
            linePass.backgroundColor = UIColor.lightGrayColor()
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if(textField == emailSignUp ){
            PassSignUp.becomeFirstResponder()
            
        }
        if (PassSignUp == textField) {
            PassSignUp.resignFirstResponder()
            SignUpOK()
            
        }
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        textField.addTarget(self, action: #selector(FromSignUp.checkDieuKien), forControlEvents: UIControlEvents.EditingChanged)
        
        return true
    }
    
    
    func checkDieuKien(){
        
        if (emailSignUp.text != "" && PassSignUp.text != ""){
            
            btnSignUp.enabled = true
            btnSignUp.backgroundColor = UIColor.redColor()        }
    }
    
    func SignUpOK(){
        
        
        userDangKi.setObject(emailSignUp.text!, forKey: "emailNew")
        userDangKi.setObject(PassSignUp.text!, forKey: "passNew")
        
        UIView.animateWithDuration(0.4, animations: {
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            }, completion: nil)
        
    
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    


    @IBAction func BtnExit(sender: UIButton) {
        
    
        self.dismissViewControllerAnimated(true, completion: nil)
    
    
    }

}

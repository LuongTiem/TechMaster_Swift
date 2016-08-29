//
//  FormSignIn.swift
//  FormSign
//
//  Created by ReasonAmu on 7/14/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class FormSignIn: UIViewController,UITextFieldDelegate {
    
    

    @IBOutlet weak var switchChosse: UISwitch!
    @IBOutlet weak var _srollview: UIScrollView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var txtPassword: UITextField!

    @IBOutlet weak var Line_Email: UIView!
  
    @IBOutlet weak var Line_Password: UIView!
    
    var USER = ["luongtiem": "123","trunghop" : "456", "kienngo" : "asdf"]
    
    var userData = NSUserDefaults()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        self.txtPassword.delegate = self
        self.txtEmail.delegate = self
        btnAction.backgroundColor = UIColor.clearColor()
        btnAction.layer.borderColor = UIColor.whiteColor().CGColor
        btnAction.layer.borderWidth = 1

        AddImageInTextFild()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ShowHiddenKeyboard), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ShowHiddenKeyboard), name: UIKeyboardWillHideNotification, object: nil)
        
       TapGuestRecognizer()
        
   
        if (switchChosse.on){
            
            loadDataFilePlist()
            btnAction.enabled = true
            btnAction.backgroundColor = UIColor.redColor()
        
            
        }else{
            
            txtPassword.text = ""
            txtEmail.text = ""
             btnAction.enabled = false
        }
        
      
    }
    
    
    //-- load and written file plist
    func loadDataFilePlist(){
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("MyList.plist")
   
       
        
      
        let MYDICTIONARY = NSDictionary(contentsOfFile: path)
        if let dict = MYDICTIONARY {
            txtEmail.text = dict.objectForKey("email") as! NSString as String
            txtPassword.text = dict.objectForKey("pass") as! NSString as String
        }else{
            print("LOix")
        }
       
        
    }
    
    func saveFilePlist() {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("MyList.plist")
        
        let dict: NSMutableDictionary  = ["Email" : "Password"]
            //saving values
        dict.setObject(txtEmail.text!, forKey: "email")
        dict.setObject(txtPassword.text!, forKey: "pass")
        //...
        
        //writing to GameData.plist
        dict.writeToFile(path, atomically: false)
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        print("Saved filePList file is --> \(resultDictionary?.description)")
    }

    
    @IBAction func SwitchAction(sender: UISwitch) {
        
        if (switchChosse.on){
            
             loadDataFilePlist()
            
            
        }else{
            txtPassword.text = ""
            txtEmail.text = ""
        }
        
        
    }
 
    
    //-- Tap
    func TapGuestRecognizer(){
        
        let  tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tapScreen(){
        
        self.view.endEditing(true)
        
    }
    
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
         self.navigationController?.navigationBarHidden = true
        
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let email = userData.objectForKey("emailNew"), let pass = userData.objectForKey("passNew"){
           USER[email as! String] = pass as? String
            txtEmail.text = String(email)
            txtPassword.text = String(pass)
        }
        print(USER)
    }

    
    func AddImageInTextFild(){
        
        let img_Email = UIImageView(image: UIImage(named: "user"))
        img_Email.frame = CGRectMake(0, 0, 40, txtEmail.frame.height)
        
        txtEmail.leftView = img_Email
        txtEmail.leftView?.contentMode = UIViewContentMode.Center
        txtEmail.leftViewMode  = UITextFieldViewMode.Always
        
        
        let img_Pass = UIImageView(image: UIImage (named: "pass"))
        img_Pass.frame = CGRectMake(0, 0, 40, txtPassword.frame.height)
        
        txtPassword.leftView = img_Pass
        txtPassword.leftView?.contentMode = UIViewContentMode.Center
        txtPassword.leftViewMode = UITextFieldViewMode.Always
        
        
        //- replace color placehoder textfield 
        if let placeHolderEmail = txtEmail.placeholder {
            txtEmail.attributedPlaceholder = NSAttributedString(string: placeHolderEmail, attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        }
        if let placeHolderPass = txtPassword.placeholder {
            txtPassword.attributedPlaceholder = NSAttributedString(string: placeHolderPass, attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        }
        
    }
        
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if(textField == txtEmail) {
            txtEmail.leftViewMode = UITextFieldViewMode.Never
            Line_Email.backgroundColor = UIColor.whiteColor()
            return true
        }
        
        if(textField == txtPassword){
            txtPassword.leftViewMode = UITextFieldViewMode.Never
            Line_Password.backgroundColor = UIColor.whiteColor()
            return true
        }
        
         return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if(textField == txtEmail){
            txtEmail.leftViewMode = UITextFieldViewMode.Always
            Line_Email.backgroundColor = UIColor.lightGrayColor()
        }
        if(textField == txtPassword){
            txtPassword.leftViewMode = UITextFieldViewMode.Always
            Line_Password.backgroundColor = UIColor.lightGrayColor()
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if(textField == txtEmail ){
            txtPassword.becomeFirstResponder()
            
        }
        if (txtPassword == textField) {
           txtPassword.resignFirstResponder()
            btnOK()
            
          
        }
        return true
    }
  
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
         textField.addTarget(self, action: #selector(FormSignIn.checkKiTu), forControlEvents: UIControlEvents.EditingChanged)
        
        return true
    }
    
    func checkKiTu(){
        
        if(txtPassword.text != "" && txtEmail.text != ""){
            btnAction.enabled = true
            btnAction.backgroundColor = UIColor.redColor()
        }else{
            btnAction.enabled = false
            btnAction.backgroundColor = UIColor.clearColor()
        }
        
      
    }
    //-- Show and hidden keyboard 
    
    
    
    func ShowHiddenKeyboard(notification : NSNotification){
        
        if let userInfo  = notification.userInfo{
            
            let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue()
            let changeInHeight = keyboardFrame!.height + 40
            let isKeyboardShowing = notification.name == UIKeyboardWillShowNotification
            
            if isKeyboardShowing{
                _srollview.contentInset.bottom = changeInHeight
                _srollview.scrollIndicatorInsets.bottom = changeInHeight
            }else{
                _srollview.contentInset.bottom = 0
                _srollview.scrollIndicatorInsets.bottom = 0
            }
            
            
            UIView.animateWithDuration(0, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.view.updateFocusIfNeeded()
                }, completion: { (completed) in
                    //==
                    if isKeyboardShowing{
                        
                    }
            })
           
        }
        
    }
    

    
    
    @IBAction func Btn_Action(sender: AnyObject) {
     
        btnOK()
        saveFilePlist()
    
    }
    
    func btnOK(){
        //--check 
        
        
        if let userTonTai = USER[txtEmail.text!]{
            
            if userTonTai  == txtPassword.text! as String {
                
                let mainVC = self.storyboard?.instantiateViewControllerWithIdentifier("MainVC")
                self.navigationController?.pushViewController(mainVC!, animated: true)
                
            }else{
                
                AlertViewShow("", message: "Mat Khau Sai", bool: true)
            }
            
        }else{
            
         AlertViewShow("Thong Bao", message: "Tai Khoan Khong Ton Tai", bool: true)
        }
        
       
    }
    
    
    func AlertViewShow(title : String, message : String, bool : Bool){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
        let actionCancel =  UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let actionOk = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        let titleC = NSMutableAttributedString(string: title)
        titleC.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(0, title.characters.count))
        
        let messageC = NSMutableAttributedString(string: message)
        messageC.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range:NSMakeRange(0, message.characters.count))
        
        alertController.setValue(titleC, forKey: "attributedTitle")
        alertController.setValue(messageC, forKey: "attributedMessage")
        
        actionCancel.setValue(UIColor.redColor(), forKey: "titleTextColor")
        
        
      
        if(bool){
            
            alertController.addAction(actionCancel)
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        }else{
            
            
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
         alertView.addTextFieldWithConfigurationHandler({ (textEmail) in
            
         })
            
         alertView.addTextFieldWithConfigurationHandler({ (textPass) in
           
         })
            alertView.addAction(actionCancel)
            alertView.addAction(actionOk)
           
          self.presentViewController(alertView, animated: true, completion: nil)
         
        }
        
        
        
        
    }
    
 
 
    @IBAction func ActionDangKi(sender: UIButton) {
        
         let signUp = self.storyboard?.instantiateViewControllerWithIdentifier("SignUp")
            signUp?.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(signUp!, animated: true, completion: nil)
        
    }
   
    
    
}

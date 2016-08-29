//
//  LoginViewController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/15/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var LogoToTopViewContraint: NSLayoutConstraint!

    var users : [User]!
    
    var isAuthenticated : Bool!
    
    @IBOutlet weak var usernameInputTextField: CustomTextField!
    
    
    @IBOutlet weak var passwordInputTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateContraint(LogoToTopViewContraint)
        
        createUser()
        tranprent = true
        setTitleBackButton("")
        
        
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        let signUpVC = self.storyboard?.instantiateViewControllerWithIdentifier("SignUpVC") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }

    @IBAction func loginAction(sender: AnyObject) {
        checkUserAuth()
    }
    
    func createUser() {
        
        let user1 = User(name: "123", password: "123")
        let user2 = User(name: "lucio", password: "123456")
        let user3 = User(name: "lucia", password: "123456")
        
        users = [user1, user2, user3]
    }
    
    func checkUserAuth(){
        for user in users {
            
            guard let username = user.name else {return}
            guard let password = user.password else {return}
            
            guard let usernameTextField = usernameInputTextField.text else {return}
            guard let passwordTextField = passwordInputTextField.text else {return}
            
            if username == usernameTextField && password == passwordTextField{
                isAuthenticated = true
                break
            }else{
                isAuthenticated = false
            }
        }
        
        if isAuthenticated == true{
            
            let tabBar = BaseTabbarController()
            presentViewController(tabBar, animated: true, completion: nil)
           
            
        }else{
            let alertController = UIAlertController(title: "Error", message: "No Information", preferredStyle: .Alert)
            
            let alertAction = UIAlertAction(title: "Try Again", style: .Default, handler: nil)
            alertController.addAction(alertAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
}

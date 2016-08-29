//
//  ViewController.swift
//  SignInGoogleDemo
//
//  Created by ReasonAmu on 7/18/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnGoogleDemo = GIDSignInButton(frame: CGRectMake(0,0,100,30))
        
        btnGoogleDemo.center  = self.view.center
        view.addSubview(btnGoogleDemo)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        
        
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            
            print(userId)
            print(idToken)
            print(fullName)
            print(givenName)
            print(familyName)
            print(email)
            print("Avater \n\(user.profile.imageURLWithDimension(400))")
            // ...
        } else {
            print("\(error.localizedDescription)")
        }
    }
   

}


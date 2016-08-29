//
//  YourBookController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/16/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class YourBookController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let cameraButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action:#selector(YourBookController.takePicture))
        let btnItem2 = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: #selector(btnItem))
        
        navigationItem.leftBarButtonItems = [cameraButtonItem,btnItem2]

        
        
        //-- custom button item for me 
        
        let rightButtonForMe = UIBarButtonItem(image: UIImage(named: "EMAIL"), landscapeImagePhone:  UIImage(named: "Confirm"), style: .Plain, target:self , action: #selector(rightButtonForMe(_:)))
        
        
        navigationItem.rightBarButtonItem = rightButtonForMe
    }
    
    func btnItem(){
        
        print("Book Mark")
        
    }
    func takePicture()-> Void {
        
        print("Take Picture")
        
    }
    
    
    func rightButtonForMe(seder : AnyObject){
        
        print("Send Email")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

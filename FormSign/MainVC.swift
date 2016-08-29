//
//  DetailVC.swift
//  FormSign
//
//  Created by ReasonAmu on 7/25/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        tabBar.items?[0].badgeValue = "Hi"
        tabBar.items?[2].badgeValue = "H.."
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}

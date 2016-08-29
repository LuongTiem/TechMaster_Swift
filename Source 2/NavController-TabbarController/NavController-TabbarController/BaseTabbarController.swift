//
//  BaseTabbarController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/17/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 0.149, green: 0.2, blue: 0.255, alpha: 1.0)
        tabBar.translucent = false
        
        //-- Font:
        let font  = UIFont(name: "SFUIText-Regular", size: 13)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor(),NSFontAttributeName : font!]
           , forState:.Normal)
       
      
       
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        let bookVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("YourBookVC") as! YourBookController
        
        let homeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeVC") as! HomeViewController
        
        let profileVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileViewController
        
        
        let bookNav = BaseNavigationController(rootViewController: bookVC)
        let homeNav = BaseNavigationController(rootViewController: homeVC)
        let proNav =  BaseNavigationController(rootViewController: profileVC)
       
        
        
        settingNavigationForEachController(bookVC, transparent: true, navTitle: "BOOK NAV", tabbarTitte: "Book", images: "Book", selectedImage: "Selected-URBook")
        settingNavigationForEachController(homeVC, transparent: true, navTitle: "HOME NAV", tabbarTitte: "Home", images: "Home", selectedImage: "Selected-Home")
        settingNavigationForEachController(profileVC, transparent: true, navTitle: "PROFILE NAV", tabbarTitte: "Profile", images: "Profile", selectedImage: "Selected-Profile")
        
        
        viewControllers = [bookNav,homeNav,proNav]
        
       

    
        
    }
    
    func settingNavigationForEachController(viewcontroller : BaseViewController ,transparent : Bool,navTitle :String,
         tabbarTitte: String , images : String, selectedImage:String){
        
        viewcontroller.navigationItem.title = navTitle
      
        
        viewcontroller.tabBarItem = UITabBarItem(title: tabbarTitte, image: UIImage(named: images)?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal))
        viewcontroller.tranprent = transparent
        
    }
    
    
    
}

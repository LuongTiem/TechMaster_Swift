//
//  BaseViewController.swift
//  NavController-TabbarController
//
//  Created by Vinh The on 7/16/16.
//  Copyright © 2016 Vinh The. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
        
    }
    
    //-- truyen bien kieu didSet 
    var tranprent : Bool?{
            didSet{
                if tranprent == true{
                    setTranparentForUINavigationaBar()
                  
                }
            
            }
    
    }
    
    var setTitleForBackButton:String?{
        didSet{
        guard let title = setTitleForBackButton else {return}
        setTitleBackButton(title)
        }
    
    }
    
    func setTranparentForUINavigationaBar(){
        //-- an navigationBar bang cach truyen vao 1 anh k co  j
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //-- navigator
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : UIFont(name: "SFUIText-Bold", size: 15)!]
    }
    
    
    
    func setTitleBackButton(title :String){
        
        let backButton  = UIBarButtonItem()
        backButton.title = title
        navigationItem.backBarButtonItem = backButton
    }
    
    
    
    
    // MARK: Update Contraints
    
    func updateContraint(contraint : NSLayoutConstraint!){
        print(contraint.constant)
        
        let scale = UIScreen.mainScreen().bounds.size.height / 667
        
        contraint.constant = contraint.constant * scale
        
        print(contraint.constant)
    }
    
}

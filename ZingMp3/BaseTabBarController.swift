//
//  BaseTabBarController.swift
//  ZingMp3
//
//  Created by ReasonAmu on 8/21/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController,UISearchBarDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //-- add Tab Music Local
    
        let tabLocal = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabLocal")
            tabLocal.tabBarItem = UITabBarItem(title: "MyMusic", image: UIImage(named: "Music.png"), selectedImage: nil)
        
        
        let tabOnline = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("tabOnline")
            tabOnline.tabBarItem = UITabBarItem(title: "Online", image: UIImage(named: "Download.png"), selectedImage: nil)
        
        
        self.viewControllers = [tabLocal,tabOnline]
        
        self.title  = "Music"
        self.tabBar.barStyle = .Black
    }
    
    
    //-- add button search
    func addButtonSearch(){
        let searchController = UISearchController(searchResultsController: nil)
       // searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search....."
        definesPresentationContext = true
        
        
    }
    
}

//
//  RootView.swift
//  AppReadBook
//
//  Created by ReasonAmu on 8/17/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class RootView: UITabBarController , UITabBarControllerDelegate {
    //-- data
    let booksPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    let booksDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
        
    ]
    
    
    let booksHTML = [
        ("Lập trình iOS Objective-C")
    ]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //-- add Tab PDF
        let itemPDF = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("bookPDF") as! BookPDF
        itemPDF.baseBook = Book(title: "PDF", book: booksPDF)
        
        itemPDF.tabBarItem = UITabBarItem(title: itemPDF.baseBook!.title, image: UIImage(named: "pdf.png"), selectedImage: nil)
        
        
        //-- add Tab Docx
        let itemDocx = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("bookDocx") as! BookDocx
            itemDocx.baseBook = Book(title: "DOCX", book: booksDocx)
        itemDocx.tabBarItem = UITabBarItem(title: itemDocx.baseBook!.title, image: UIImage(named: "doc.png"), selectedImage: nil)
        
        //-- add TabHTML
        let itemHTML = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("bookHTML") as! BookHTML
            itemHTML.baseBook = Book(title: "HTML", book: booksHTML)
        itemHTML.tabBarItem = UITabBarItem(title: itemHTML.baseBook!.title, image: UIImage(named: "html.png"), selectedImage: nil)
        
        //-- add TabWeb
        let itemWeb  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("web") as!
            UrlVC
            itemWeb.baseBook = Book(title: "WEB", book: nil)
        itemWeb.tabBarItem = UITabBarItem(title:itemWeb.baseBook!.title, image: UIImage(named: "web.png"), selectedImage: nil)
        
        
        
        
        let controllers = [itemPDF,itemDocx,itemHTML,itemWeb]
        self.viewControllers = controllers
        
        
        //--- set title 
        self.title = "Read Book"
        
        //-- set style tabbar
        self.tabBar.barStyle =  .Black
        
        
    }
    
    
    //Delegate methods
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
      //  print("Should select viewController: \(viewController.title) ?")
        return true;
    }
}

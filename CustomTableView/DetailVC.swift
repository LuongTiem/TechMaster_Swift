//
//  DetailVC.swift
//  CustomTableView
//
//  Created by ReasonAmu on 8/10/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let img = "\(self.title!).jpg" as String
        self.img.image = UIImage(named: img)
        self.img.contentMode = .ScaleAspectFit
        

    }
 
}

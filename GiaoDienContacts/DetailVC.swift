//
//  DetailVC.swift
//  GiaoDienContacts
//
//  Created by ReasonAmu on 8/11/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var person = Person()
    var labelName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.whiteColor()
        self.labelName.frame = CGRectMake(100, 100, 300, 50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.lastName + " "  + person.firstName
        self.view.addSubview(labelName)
    }

}

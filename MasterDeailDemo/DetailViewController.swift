//
//  DetailViewController.swift
//  MasterDeailDemo
//
//  Created by ReasonAmu on 8/8/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbl_Label: UILabel!
    
    var cellName: String?{
        didSet{
            configure()
        }
    }
    
 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }

    func configure(){
        
        if let realCellName = cellName{
            
            if let nameLabel = lbl_Label {
                 nameLabel.text = realCellName
            }
        }
    }


}

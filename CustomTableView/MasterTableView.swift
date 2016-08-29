//
//  ViewController.swift
//  CustomTableView
//
//  Created by ReasonAmu on 8/10/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class MasterTableView: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tbl: UITableView!
    var data:[DataItem]!
    var detailVC : DetailVC!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.tbl.delegate = self
            self.tbl.dataSource = self
        

        
 

        //-- khoi tao 
        let item1:DataItem = DataItem.init(nameFC: "Manchester United", nameStd: "Old Trafford", imgLogo: "MU.png", imgStar: 3)
         let item2:DataItem = DataItem.init(nameFC: "Chelsea", nameStd: "Stamford Bridge", imgLogo: "Chelsea.png", imgStar: 2)
         let item3:DataItem = DataItem.init(nameFC: "Liverpool", nameStd: "Anfield", imgLogo: "Liverpool.png", imgStar: 1)
         let item4:DataItem = DataItem.init(nameFC: "Manchester City", nameStd: "Etihad", imgLogo: "MC.png", imgStar: 4)
         let item5:DataItem = DataItem.init(nameFC: "Arsenal", nameStd: "Emirates", imgLogo: "Arsenal.png", imgStar: 5)
        
        data=[item1,item2,item3,item4,item5]
    

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "FC Club"
    }


   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:CustomCell! = self.tbl.dequeueReusableCellWithIdentifier( "Cell", forIndexPath: indexPath) as! CustomCell
        let item:DataItem = data[indexPath.row]
           cell.lblStadium.text = item.nameStadium
           cell.lblFootBallClub.text = item.nameFootBallClub
           cell.imgStar.image = item.imageStarRating
           cell.imgLogo.image = item.imageLogo
           cell.accessoryType = .DisclosureIndicator
        return cell
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
      
        if detailVC == nil {
            detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("detailVC") as! DetailVC
        }
        
        let item:DataItem = data[indexPath.row]
            detailVC.title = item.nameStadium
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}


//
//  ViewController.swift
//  SampleBlock
//
//  Created by ReasonAmu on 8/18/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dem:Int = 0
    
    var img: [String] = ["http://www.m88vnbet.com/wp-content/uploads/2016/04/hot-girl-thai-lan-12.jpg",
                         "http://media1.tinngan.vn/archive/images/2015/06/23/073906_9.jpg",
                         "http://toananhdep.com/wp-content/uploads/2016/03/toananhdep-Nhung-hot-girl-dang-noi-nhu-con-tren-cong-dong-mang07.jpg","http://www.xaluan.com/images/news/Image/2016/06/13/1465785718-hai-yen-11---copy.jpg"]
    //-- khai bao 1 block
    
    var block1:( () -> (Void) )?
    var block2 = {
        (p1: Int) in
        
        print("Log  \(p1) .............. complite")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        block2(100)
        
        
        printSomething("In tham so p1 ") {
            
            print("Da hoan thanh -> completion ")
        }
    }
    
    
    
    //-- c3
    
    func printSomething(p1: String,completion :() ->()){
        
        print(p1)
        completion()
    }
    
    
    
    //--- load test data
    func loadDataURl(completion : (data: NSData ,index: Int) -> ()){
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            //--
            for stringUrl in self.img{
                
                if let url = NSURL(string: stringUrl){
                    if let data = NSData(contentsOfURL: url){
                        completion(data: data, index: self.img.indexOf(stringUrl)!) //-- lay chi so phan tu array
                    }
                }
            }
        }
        
        
    }
    
    
    @IBAction func playAction(seder : AnyObject){

            
            self.loadDataURl { (data, index) in
                
                dispatch_sync(dispatch_get_main_queue(), {
                    if let imgView = self.view.viewWithTag(100 + index) as? UIImageView {
                        
                        imgView.image = UIImage(data:data)
                    }
                })
               
            }
  
        
        
    }
    
    
    @IBAction func playLuong2(seder : AnyObject){
        dem = dem + 1
        print("Dem \(dem)")
    }
    
}


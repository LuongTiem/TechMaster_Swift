//
//  HomeView.swift
//  FashionShop_v1
//
//  Created by ReasonAmu on 8/15/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class HomeView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
  var items:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var myDict:NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist"){
            
            myDict = NSDictionary(contentsOfFile: path)
        }

        
        
        //-- 
        for dic in myDict!.allValues{
            
            let name:String = dic["name"] as! String
            let content:String = dic["content"] as! String
            let nameImages:[String] = dic["images"] as! NSArray as! [String]
            let price:String = dic["price"] as! String
            
//            print(name)
//            print(content)
//            print(nameImages)
//            print(price)
            
            items.append(Item(name: name, content: content, nameImage: nameImages, price: price))
            
        }
       
      
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem

        
        cell.addSubViews(true)
        cell.nameLabel.text  = items[indexPath.item].name
        cell.price.text = items[indexPath.item].price
        cell.imageView.image = UIImage(named: items[indexPath.item].nameImages[0]+".jpg" )
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("detailVC") as! ListImage
        listView.item = items[indexPath.item]
        self.navigationController?.pushViewController(listView, animated: true)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    

}

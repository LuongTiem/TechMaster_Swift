//
//  ListImage.swift
//  FashionShop_v1
//
//  Created by ReasonAmu on 8/6/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ListImage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var nameShop: UILabel!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var contentShop: UITextView!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameShop.text = item.name
        contentShop.text = item.content
        imgProfile.image = UIImage(named:item.nameImages[0] + ".jpg")
        imgProfile.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ListImage.tapImg(_:)))
        imgProfile.addGestureRecognizer(tap)
        self.navigationController?.navigationBarHidden = false
    }
    
  
    
    func tapImg(tapGesture : UITapGestureRecognizer){
        
        pushView(0)
    }


    
    
    func pushView(index : Int){
        
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("scrollVC") as! ViewScroll
        listView.pageImages = item.nameImages
        listView.currentPage = index
        
        self.navigationController?.pushViewController(listView, animated: true)
    }
    //---
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return item.nameImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellItem", forIndexPath: indexPath) as! CellItem
        cell.kCellWidth = 60 //-- gan lai gia tri chieu cao cell
        cell.addSubViews(false)
        cell.imageView.image = UIImage(named:item.nameImages[indexPath.item] + ".jpg") 
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        pushView(indexPath.item)
        
    }
}

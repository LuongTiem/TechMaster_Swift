//
//  BaseViewController.swift
//  AppReadBook
//
//  Created by ReasonAmu on 8/17/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var baseBook: Book?
    var mang:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        mang = baseBook?.book
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionCell
            cell.addAllSubviews()
            cell.imageView.image = UIImage(named:mang[indexPath.item] + ".jpg")
            cell.nameLabel.text = mang[indexPath.item]
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mang.count
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("detailVC") as! DetailVC
        //-- truyen duong dan file
        var urlString:String!
        urlString = baseBook?.book![indexPath.item]
        
        detailVC.urlStringBase = urlString
        detailVC.type = baseBook!.title
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    //--set lai size cell
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(100, 120)
    }
}

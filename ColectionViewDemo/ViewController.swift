//
//  ViewController.swift
//  ColectionViewDemo
//
//  Created by ReasonAmu on 7/19/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController :UICollectionViewController{
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellID", forIndexPath: indexPath) 
        return cell
    }
    
    
}


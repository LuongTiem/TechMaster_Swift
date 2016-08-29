//
//  ViewScroll.swift
//  FashionShop_v1
//
//  Created by ReasonAmu on 8/5/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollview: UIScrollView!
    var pageImages : [String] = []
    var photo : [UIImageView] = []
    var arrayScrollView : [UIScrollView] = []
    var first: Bool = false
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        pageController.currentPage = currentPage
        pageController.numberOfPages = pageImages.count
    
        
       
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        self.first = false //-- add lai subview scrollview
    
        
        
        
    }

  

    override func viewDidLayoutSubviews() {
        
        
        if (!first) {
            first = true
            let pageScrollViewSize = scrollview.frame.size
            scrollview.contentSize = CGSizeMake(pageScrollViewSize.width * CGFloat(pageImages.count), 0)
            scrollview.contentOffset = CGPointMake(CGFloat(currentPage) *  pageScrollViewSize.width, 0)
            
            //-- remove photo, mang scrollview,cac view da~ add trong scrollview cha
            if (photo.count > 0)
            {
                for subView in scrollview.subviews
                {
                    subView.removeFromSuperview()
                    
                }
                
            }

            
            
            for i in 0..<pageImages.count {
                
                let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                imgView.frame = CGRectMake(0, 0, pageScrollViewSize.width, pageScrollViewSize.height)
                imgView.contentMode = .ScaleAspectFit
                imgView.userInteractionEnabled = true
                imgView.multipleTouchEnabled = true
                
                //-- create tapgesturegecognizer
                let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewScroll.tapImg(_:)))
                singleTap.numberOfTapsRequired = 1
                imgView.addGestureRecognizer(singleTap)
                
                let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewScroll.doubleImg(_:)))
                doubleTap.numberOfTapsRequired = 2
                singleTap.requireGestureRecognizerToFail(doubleTap)
                imgView.addGestureRecognizer(doubleTap)
                
                photo.append(imgView) //-- add image
                
                //--create subScrollView
                let subScrollView  = UIScrollView(frame:CGRectMake(CGFloat(i) * pageScrollViewSize.width, 0, pageScrollViewSize.width, pageScrollViewSize.height) )
                    subScrollView.minimumZoomScale = 1
                    subScrollView.maximumZoomScale = 2
                    subScrollView.delegate = self
                    subScrollView.contentSize = imgView.bounds.size //-- set contentsize cho subcscrollview
                    subScrollView.addSubview(imgView)
                
                
              
                arrayScrollView.append(subScrollView) //-- add subScrollview
                
               
        
                scrollview.backgroundColor = UIColor.whiteColor()
                
                self.scrollview.addSubview(subScrollView)
                
        }
         
        }
        
    }
    
    
    //-- func view zoom image
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return photo[pageController.currentPage]
        
    }
    
    func tapImg(gesture : UITapGestureRecognizer){
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(arrayScrollView[pageController.currentPage].zoomScale * 1.5, center: position)
        
        self.updateFocusIfNeeded()
    }
    func doubleImg(gesture : UITapGestureRecognizer){
        let position = gesture.locationInView(photo[pageController.currentPage])
        zoomRectForScale(arrayScrollView[pageController.currentPage].zoomScale * 0.5, center: position)
        self.updateFocusIfNeeded()
    }
    
    func zoomRectForScale(scale : CGFloat , center : CGPoint){
        var zoomRect = CGRect()
        let scrollviewSize = scrollview.bounds.size
        zoomRect.size.height  = scrollviewSize.height / scale
        zoomRect.size.width   = scrollviewSize.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        print(zoomRect)
        arrayScrollView[pageController.currentPage].zoomToRect(zoomRect, animated: true)
        
        
    }
    
    
    //---
    
   
    @IBAction func btn_Previous(sender: UIButton) {
        
        currentPage = pageController.currentPage
        if(currentPage > 0) {
            
            currentPage -= 1
            
        }else {
            
            currentPage = pageImages.count - 1
        }
        pageController.currentPage = currentPage
        scrollview.contentOffset = CGPointMake(CGFloat(currentPage) * scrollview.frame.size.width, 0)
        
    }
    
    
    @IBAction func btn_Next(sender: UIButton) {
        
        currentPage = pageController.currentPage
        if (currentPage < pageImages.count - 1) {
            currentPage += 1
        }else {
            currentPage = 0
        }
        pageController.currentPage = currentPage
        scrollview.contentOffset = CGPointMake(CGFloat(currentPage) * scrollview.frame.size.width, 0)
       

    }
    
    //--pageview
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageNow:Int = Int(scrollview.contentOffset.x / scrollview.frame.size.width)
        pageController.currentPage = pageNow
        
    }
    //-- btn PageView
    @IBAction func btn_pageview(sender: UIPageControl) {
        scrollview.contentOffset = CGPointMake(CGFloat(pageController.currentPage)  * scrollview.frame.size.width, 0)
    }
}

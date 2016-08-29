//
//  DetailVC.swift
//  AppReadBook
//
//  Created by ReasonAmu on 8/17/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController,UIWebViewDelegate{
    
    @IBOutlet weak var getCurrentTime: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    var type:String!
    var urlStringBase :String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlStringBase
        self.webView.delegate = self
        self.activityIndicator.startAnimating()
        var urlPath = "default"
        
        switch type {
        case "PDF": urlPath = NSBundle.mainBundle().pathForResource(urlStringBase, ofType: "pdf")!
            getCurrentTime.hidden = true
            break
        case "DOCX": urlPath = NSBundle.mainBundle().pathForResource(urlStringBase, ofType: "docx")!
            getCurrentTime.hidden = true
            break
        case "HTML": urlPath = NSBundle.mainBundle().pathForResource(urlStringBase, ofType: "html")!
            getCurrentTime.hidden = false
            break
        default:
            break
        }
        
        
        
        let url:NSURL = NSURL.fileURLWithPath(urlPath)
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        
    }
    
    
    @IBAction func GetCurrenTime(sender: UIButton) {
        
        self.webView.stringByEvaluatingJavaScriptFromString("hello()")
    }

    //-- sau khi load xong
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator.hidden = true
        self.activityIndicator.stopAnimating()
    }
    
    //--
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print("Bat dau request")
        return true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        print("Load bi loi")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

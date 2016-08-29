//
//  UrlVC.swift
//  AppReadBook
//
//  Created by ReasonAmu on 8/17/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

class UrlVC: UIViewController,UITextFieldDelegate,UIWebViewDelegate {
    var baseBook:Book?
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var txtInPut: UITextField!
    
    var http:String = "http://www."
        override func viewDidLoad() {
        super.viewDidLoad()
        loading.hidden = true
        txtInPut.placeholder = "Nhap dia chi website"
        txtInPut.layer.borderColor = UIColor.redColor().CGColor
        txtInPut.layer.borderWidth = 1
        txtInPut.layer.cornerRadius = 8
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        loading.hidden = false
        let url = NSURL(string: http + textField.text!)
        let urlRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(urlRequest)
        loading.stopAnimating()
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        loading.hidden = true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("Loi")
//        let alertController = UIAlertController(title: "Error", message: "", preferredStyle: .Alert)
//        let actionOK = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
//        alertController.addAction(actionOK)
//        self.presentViewController(alertController, animated: true, completion: nil)
        loading.hidden = true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("Request")
    }
}

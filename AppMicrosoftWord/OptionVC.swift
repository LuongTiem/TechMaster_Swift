//
//  OptionVC.swift
//  AppMicrosoftWord
//
//  Created by ReasonAmu on 8/12/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

protocol OptionDelegate {
    
    func setColor(colorName : UIColor)
}

class OptionVC: UIViewController {
    
    
    @IBOutlet weak var currentStyle: UILabel!
    
    @IBOutlet weak var currentAligment: UILabel!
    
    @IBOutlet weak var currentColor: UILabel!
    @IBOutlet weak var currentFontName: UITextField!
    @IBOutlet weak var currentSize: UITextField!
    
        //--
    var option: OptionFont!
    var delegate :OptionDelegate! = nil
    var colorLabelText: String! = nil
    var completion:((para1:String, para2 : String) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        currentSize.text = String(option.size)
        getAlignmnent()
        
    }
    
    
    func getAlignmnent(){
      
        
        currentSize.text = String(option.size!)
        currentFontName.text = option.fontName
        currentColor.backgroundColor = option.color
        var align = ""
        
        switch (option.alignment) {
        case 0 : align = "Left"
            break
        case 1 : align = "Center"
            break
        case 2 : align = "Right"
            break
        default:
            break
        }
        currentAligment.text = align
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //-- su dung ky thuat singleton
        let option = OptionFont.shareInstance
        option.size = Int(currentSize.text!)
        option.fontName = currentFontName.text!
        
        
        //---ki thuat block
        //self.completion!(para1: "12")
    }
    
    @IBAction func touchUpInsideSelectedColor(sender: UIButton) {
        //-- truyen du lieu qua delegate
        if let color = sender.backgroundColor{
            currentColor.backgroundColor = color
            delegate.setColor(color)
        }
        
        
    }
    
    @IBAction func touchUpInsideSystemFont(sender: UIButton) {
        
        currentAligment.text = sender.titleLabel?.text
        let dic:NSDictionary = ["Align" : sender.tag - 100]
        
        //-- thong bao den nsnotification
        NSNotificationCenter.defaultCenter().postNotificationName("Alignment", object: nil, userInfo: dic as [NSObject : AnyObject])
    }
    
    //-- using block 
  
    func setStyle(completion : (para1:String,para2 : String) -> ()){
        print("action - OKay")
        
        self.completion = completion
    }
    
    @IBAction func actionStyle(sender: UIButton) {
        
        
       
        currentStyle.text = sender.titleLabel?.text
    
        
        switch sender.tag {
        case 200:
            self.completion!(para1: "Bold",para2:"true")
            break
        case 201:
            self.completion!(para1: "Italic",para2:"true")
            break
        case 202:
            self.completion!(para1: "UnderLine",para2:"true")
            break
        default:
            break
        }
        
    }
    
    
    
    
    
    
}

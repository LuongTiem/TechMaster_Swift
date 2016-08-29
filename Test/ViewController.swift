//
//  ViewController.swift
//  Test
//
//  Created by ReasonAmu on 7/3/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit



class ViewController: UIViewController{

 
    @IBOutlet weak var txtName: UITextField!

    @IBOutlet weak var txtEmail: UITextField!

    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var textview: UITextView!
    
    @IBAction func btnDangKi(sender: AnyObject) {
        let hoten : String = txtName.text!
        let email : String = txtEmail.text!
        let phone : String = txtPhone.text!
        
        textview.text = "Test\n" + "Ho ten : " + hoten + "\nEmail : "+email + "\nPhone : " + phone;
        
    }
    
   
    
    
    
    @IBAction func btnDelete(sender: AnyObject) {
         txtPhone.text = ""
        txtEmail.text = ""
        txtName.text = ""
        textview.text = ""
    }
    
    
    
    @IBAction func ButtonSnow(sender: AnyObject) {
        
       
        
        
      
        
        for _ in 0...100 {
          
            let x : Int = Int (arc4random()%376)
            let y : Int = Int(arc4random()%668)
            let Bongtuyet : UIImageView  = UIImageView (frame:CGRectMake(CGFloat(x), CGFloat(y), 16, 16))
            
            Bongtuyet.image = UIImage(named: "Snow Storm-16")
            self.view.addSubview(Bongtuyet)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mang = ["Toi ","la","ai ","?" ,"ban ","co","biet", "khong", "?"]
        for ok in mang{
            print(ok)
            
        }
        print("---------------------------\n")
        /// cach lay index va value trong mang 
        for (index, value1) in mang.enumerate(){
            print("index \(index)" + "  value \(value1)" )
        }
        
        
        let  testSet :Set = ["IOS","Swift","Objective - c","Android","C++"]
        print("So Phan tu trong testSet : \(testSet.count)")
        // check value IOS trong testSet 
        
        if testSet.contains("IOS") {
            print("Co Phan tu IOS");
        }else{
            print("NO co ")
        }
        testSet.contains("C+") ? print("OK") : print("NO - k co C+")
    
        
        //-- Dictionary
        
        
        var dictionary : [String : String]
        dictionary = ["key1": "value 1", "key2": "value 2","key3" : "value3"]
        
        print(dictionary["key2"])
        dictionary["key4"] = "value4"
        dictionary["key5"] = "value5"
        dictionary["key6"] = "value6"
        print(dictionary)
        //-- cac gia tri them vao sap xep xep sau key1
        
        
        //-- For voi value max biet truoc
        
        for i in 0...3 {
            print("index i : \(i)")
        }
        //-- for trong mang ; 
        let array1 = ["Leona","Yasuo","Missfortun","Thress"]
        for item in array1 {
            print(item)
        }
        //-- for character trong chuoi 
        for character in "LuongTIEM".characters{
            print(character)
        }
        
        
        //-- Vong lap while 
        var i = 0
        let ketqua = 10
        
        repeat {
            i += 2
            print(i)
        }while i < ketqua
        
        // where + switch
        let testwhere = (10,10)
        switch testwhere {
        case let(x,y) where x == y:
            print("\(x)" + "==" +  "\(y)")
            break;
        case let(x,y) where x > y :
            print("\(x) > \(y)")
            break;
        case let(x,y) where x < y :
            print("\(x) < \(y)")
            break;
        default:
            print("OK")
            break;
        }
        
        //-- Continue
        
        let chuoi = "Now I run "
        var catchuoi = ""
        for kitu in chuoi.characters{
            switch kitu {
            case "N","I"," ":
                continue
            default:
              catchuoi.append(kitu)
            }
            
        }
        print(catchuoi)
        
        
        //-- Break
        
        let brea = 1
        switch brea {
        case 1:
            print("Chay vao case 1")
            
        default:
             break
        }
        
        //-- FallThrough
        let soS  = 6
        var chuoiS  = String()
        switch soS {
        case 2,3,5,6,19,199:
            chuoiS += "KetQua \(soS)"
            fallthrough
        default:
            chuoiS += " Run"
        }
        print(chuoiS)
        
        print(testHamReturn())
        print(HamKcogiatritrave())
        print(HamCoParameter("Lương Tiềm", tuoi: 21))
   
    }
    
    
    
    
    
    func testHamReturn() -> String {
        let okay = "Da chay Ham Return"
        return okay
    }
    func HamKcogiatritrave() {
        let kgiatri = "Ham k co gia tri tra ve "
    }
    func HamCoParameter(ten :String, tuoi : Int) -> String{
        
        let ghepchuoi = "Name : \(ten) --- Age :\(tuoi) "
        
        return ghepchuoi
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


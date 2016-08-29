//
//  ViewController.swift
//  Demo2048
//
//  Created by ReasonAmu on 8/1/16.
//  Copyright © 2016 ReasonAmu. All rights reserved.
//

import UIKit

enum Gestures {
    case LEFT
    case RIGHT
    case DOWN
    case UP
}

class ViewController: UIViewController {
    

    @IBOutlet weak var lbl_Bestscore: UILabel!
    @IBOutlet weak var lbl_Score: UILabel!
    let key_bestScore = "bestScore"
    let key_array = "arrayOld"
    let currentScoreKey = "currentScore"
    var score : Int = 0
    var mang = Array(count: 4, repeatedValue: Array(count: 4, repeatedValue: 0))
    var btnReset = UIButton()
    var btnContinue = UIButton()
    var checkMenu: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let dicrections : [UISwipeGestureRecognizerDirection] = [.Right, .Left, .Up, .Down] //- khai bao kieu
        
        for direction in dicrections{
            
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
            
        }
        
        if let bestScore = PlistManager.sharedInstance.getValueForKey(key_bestScore){
            lbl_Bestscore.text = bestScore as? String
        }
        
        if let currentScoreValue = PlistManager.sharedInstance.getValueForKey(currentScoreKey){
            if let lastScore = (currentScoreValue as? String){
                lbl_Score.text = lastScore
                score = Int (lastScore)!
            }
        }
        
        if score == 0 {
            randomNumber()
        }else{
            if let arrayValue = PlistManager.sharedInstance.getValueForKey(key_array){
                if let lastArray = (arrayValue as? Array<Array<Int>>){
                    mang = lastArray
                    transfer()
                }
                
            }
        }
        
        
        
        createSubview()
    }
    
    
    func createSubview(){
        
        let centerX = self.view.center.x
        let centerY = self.view.center.y
        let color = UIColor(red: 6/255, green: 191/255, blue: 173/255, alpha: 1)
        print(centerY)
        print(centerX)
        //--
        btnReset = UIButton(frame: CGRectMake(centerX - 100,centerY - 25,200,50))
        btnReset.backgroundColor = color
        btnReset.setTitle("Reset", forState: .Normal)
        btnReset.layer.borderWidth = 1.5
        btnReset.layer.borderColor = UIColor.whiteColor().CGColor
        btnReset.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        btnReset.hidden = true
        btnReset.addTarget(self, action: #selector(ViewController.Reset), forControlEvents: .TouchUpInside)
        //-- 
        btnContinue = UIButton(frame: CGRectMake(centerX - 100,centerY + 25, 200 , 50))
        btnContinue.backgroundColor = color
        btnContinue.setTitle("Continue", forState: .Normal)
        btnContinue.layer.borderWidth = 1.5
        btnContinue.layer.borderColor = UIColor.whiteColor().CGColor
        btnContinue.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        btnContinue.hidden = true
        btnContinue.addTarget(self, action: #selector(ViewController.Continue), forControlEvents: .TouchUpInside)
        
        
        self.view.addSubview(btnContinue)
        self.view.addSubview(btnReset)
      
        
    }
    
    func Continue(){
        btnContinue.hidden = true
        btnReset.hidden = true
        checkMenu = true
    }
    func Reset(){
        print("PlayAgain")
        playGame()
        btnReset.hidden = true
        btnContinue.hidden = true
        checkMenu = true
        
    }
    
    @IBAction func btn_Menu(sender: UIButton) {
        
//        let menu = self.storyboard?.instantiateViewControllerWithIdentifier("menu")
//        menu?.modalTransitionStyle = .CoverVertical
//        self.presentViewController(menu!, animated: true) { 
//            
//        }
        checkMenu = false
        btnReset.hidden = false
        btnContinue.hidden = false

    }
    func swipeGesture(gestures: UIGestureRecognizer){
        
        if let swipeGesture = gestures as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                if checkMenu
                {
                    leftGesture()
                    randomNumber()
                    checkGameOver()
                }
                break
            case UISwipeGestureRecognizerDirection.Right:
                if checkMenu
                {
                rightGesture()
                randomNumber()
                checkGameOver()
                }
                break
            case UISwipeGestureRecognizerDirection.Up:
                if checkMenu
                {
                upGesture()
                randomNumber()
                checkGameOver()
                }
                break
            case UISwipeGestureRecognizerDirection.Down:
                if checkMenu
                {
                downGesture()
                randomNumber()
                checkGameOver()
                }else{
                    print("K thuc hien lenh")
                }
                break
            default:
                break
            }
        }
    }
    
    //-- random so
    func randomNumber(){
   
        var rnlabelX = arc4random_uniform(4)
        var rnlabelY = arc4random_uniform(4)
        let rdNumber = arc4random_uniform(2) == 0 ? 2 : 4
        var isChanged: Bool = false
        
        if mang[Int(rnlabelX)][Int(rnlabelY)] == 0{
            
            isChanged = true
        }
        
        if IsArrayFull() == false {
            
            while (mang[Int(rnlabelX)][Int(rnlabelY)] != 0) {
                rnlabelX = arc4random_uniform(4)
                rnlabelY = arc4random_uniform(4)
                isChanged = true
            }
        }
        
        if isChanged == true {
            
            mang[Int(rnlabelX)][Int(rnlabelY)] = rdNumber
        }
        
       transfer()
       lbl_Score.text = String(score)
       PlistManager.sharedInstance.saveValue(String(score), forKey: currentScoreKey)
       PlistManager.sharedInstance.saveValue(mang, forKey: key_array)
        
    }
    
    
 
    
    func transfer(){
        
        for i in 0..<4{
            for j in 0..<4
            {
                let numlabel = 100 + (i * 4) + j
                ConvertNumberLable(numlabel, value: String(mang[i][j]))
                switch mang[i][j] {
                case 2,4: changeBackground(numlabel, color: UIColor.cyanColor())
                case 8,16: changeBackground(numlabel, color: UIColor.greenColor())
                case 16,32: changeBackground(numlabel, color: UIColor.orangeColor())
                case 64,128: changeBackground(numlabel, color: UIColor.redColor())
                case 128,256: changeBackground(numlabel, color: UIColor.yellowColor())
                case 512,1024: changeBackground(numlabel, color: UIColor.purpleColor())
                case 2048: changeBackground(numlabel, color: UIColor.brownColor())
                default : changeBackground(numlabel, color: UIColor.lightGrayColor())
                    
                }
                
            }
        }
        
    }
    
    func IsArrayFull() -> Bool{
        var check = true
        for row in 0..<4 {
            for col in 0..<4{
                
                if mang[row][col] == 0{
                    check = false
                    break
                }
            }
        }
        
        return check
    }
    //-- check bien tren 
    func checkUp(rowU : Int, colU : Int) -> Bool{
        
        var check = false
        if mang[rowU][colU] == mang[rowU - 1 ][colU] {
            check = true
        }
        
        return check
    }
    //-- check bien duoi 
    func checkDown(rowD : Int , colD : Int) -> Bool{
        var check = false
        if mang[rowD][colD] == mang[rowD  + 1 ][colD] {
            check = true
        }
        return check
        
    }
    
    func checkLeft (rowL : Int , colL : Int) -> Bool{
        var  check  = false
        if mang[rowL][colL] == mang[rowL][colL - 1] {
            check = true
        }
        return check
        
    }
    func checkRight (rowR : Int , colR : Int ) -> Bool {
        var check = false
        if(mang[rowR][colR] == mang[rowR][colR] + 1){
            check = true
        }
        return check
        
    }
    
    //-- check Gameover
    func gameOver() -> Bool{
        
        var check = true
        if IsArrayFull()
        {
            for col in 0...3
            {
                for row in 0...3
                {
                    
                    if row > 0 && checkUp(row, colU: col) == true{
                        check = false
                    }
                    if row < 3 && checkDown(row, colD: col) == true{
                        check = false
                    }
                    if col > 0 && checkLeft(row, colL: col) == true{
                        check = false
                    }
                    if col < 3 && checkRight(row, colR: col) == true{
                        check = false
                    }
                    
                }
                
                
            }
            
        }else {
            check = false
        }
        
        
        return check
    }
    
    //-- GameOver 
    func checkGameOver(){
        
        if gameOver() {
            
            
            if let bestScoreKey = PlistManager.sharedInstance.getValueForKey(key_bestScore){
                if Int( bestScoreKey  as! String ) < score {
                    PlistManager.sharedInstance.saveValue(String(score), forKey: key_bestScore)
                }
                
            }
            
            PlistManager.sharedInstance.saveValue("0", forKey: currentScoreKey)
            
            let alertController = UIAlertController(title: "GameOver", message: "Score New : \(score) ", preferredStyle: .Alert)
            let actionOk = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
            let actionPlayAgain = UIAlertAction(title: "Play Again", style: .Cancel, handler: { (UIAlertAction) in
                self.playGame()
            })
            actionPlayAgain.setValue(UIColor.redColor(), forKey: "titleTextColor")
            alertController.addAction(actionOk)
            alertController.addAction(actionPlayAgain)
            self.presentViewController(alertController, animated: true, completion: nil)
            print("GameOver")
        }
        
       
        
    }
    
    //-- play game 
    func playGame(){
        score = 0
        mang = Array(count: 4, repeatedValue: Array(count: 4, repeatedValue: 0))
        let dicrections : [UISwipeGestureRecognizerDirection] = [.Right, .Left, .Up, .Down] //- khai bao kieu
        
        for direction in dicrections{
            
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
        
        if let keyBestValue = PlistManager.sharedInstance.getValueForKey(key_bestScore){
            lbl_Bestscore.text = keyBestValue as? String
        }
        randomNumber()
        
    }

    
    
    //-- tinh score
    func getScore (value : Int){
        lbl_Score.text = String(Int(lbl_Score.text!)! + value)
        
    }
    
    //-- random Label
    func ConvertNumberLable(numlabel : Int , let value : String){
        let label = self.view.viewWithTag(numlabel) as! UILabel
        if(value != "0"){
        label.text = value
        }else {
        label.text = ""
        }
        

        
    }
    
    //-- doi mau background
    func changeBackground (numberLabel : Int, color : UIColor){
        
        let lable = self.view.viewWithTag(numberLabel) as! UILabel
        lable.backgroundColor = color
        
    }
    
    func upGesture(){
        for col in 0..<4 {
            var check = false
            for row in 0..<4
              {
                
                var location = row
                if (mang[row][col] == 0) {
                    
                    continue
                }
                for (var rowC = row - 1 ; rowC != -1 ; rowC--)
                {
                    if (mang[rowC][col] != 0 && (mang[rowC][col] != mang[row][col] || check)) {
                        break
                    }else{
                        location = rowC
                    }
                    
                   
                }
                if (location == row) {
                    continue
                }
                if(mang[row][col] == mang[location][col]){
                    check = true
                   
                    mang[location][col] *= 2
                    score += mang[location][col]
                    
                    
                }
                else
                {
                  mang[location][col] = mang[row][col]
                }
                
              
                
                //--  
                mang[row][col] = 0
            }
            
        }
    }
    
    func downGesture(){

        for col in 0..<4
        {
            var check = false
             for row in 0..<4
             
            {
                
                var location = row
                if (mang[row][col] == 0) {
                    
                    continue
                }
                for (var rowC = row + 1 ; rowC < 4 ; rowC++)
                {
                    if (mang[rowC][col] != 0 && (mang[rowC][col] != mang[row][col] || check)) {
                        
                        break
                    }else{
                        location = rowC
                    }
                    
                    
                }
                if (location == row) {
                    continue
                }
                if(mang[location][col] == mang[row][col]){
                    check = true
                  
                    mang[location][col] *= 2
                    score += mang[location][col]
                    
                }
                else
                {
                    mang[location][col] = mang[row][col]
                }
                
                
                
                //--
                mang[row][col] = 0
            }
            
        }

        
    }
    func leftGesture(){
        for row in 0..<4
        {
            var check = false
            for col in 0..<4
            {
                //--
                var locationC = col
                if (mang[row][col] == 0) {
                    
                    continue
                }
                
                for (var colC = col - 1 ; colC != -1 ; colC--)
                {
                    if (mang[row][colC] != 0 && (mang[row][colC] != mang[row][col] || check)) {
                        
                        break
                    }else{
                        locationC = colC
                    }
                    
                    
                }
                if (locationC == col) {
                    continue
                }
                if(mang[row][locationC] == mang[row][col]){
                    check = true
                    
                    mang[row][locationC] *= 2
                    score +=  mang[row][locationC]
                    
                }
                else
                {
                    mang[row][locationC] = mang[row][col]
                }
                
                
                
                //--
                mang[row][col] = 0
            }
            
        }

    }
    
    func rightGesture(){
        
            for row in 0..<4
        {
            var check = false
            for ( var col = 3; col != -1 ; col--)
            {
                //--
                var locationC = col
                if (mang[row][col] == 0) {
                    
                    continue
                }
                
                for (var colC = col + 1 ; colC < 4 ; colC++)
                {
                    if (mang[row][colC] != 0 && (mang[row][colC] != mang[row][col] || check)) {
                        break
                    }else{
                        locationC = colC
                    }
                    
                    
                }
                if (locationC == col) {
                    continue
                }
                if(mang[row][locationC] == mang[row][col]){
                    check = true
                    
                    mang[row][locationC] *= 2
                    score += mang[row][locationC]
                    
                }
                else
                {
                    mang[row][locationC] = mang[row][col]
                }
                
                
                
                //--
                mang[row][col] = 0
            }
            
        }
        
        
    }
    
    
  
}


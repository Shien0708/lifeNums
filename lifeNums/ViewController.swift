//
//  ViewController.swift
//  lifeNums
//
//  Created by 方仕賢 on 2022/2/18.
//

import UIKit

var date = ""
var month = ""
var year = ""
var sign = ""

var giftNums = [Int]()
var birthNum = 0
var allNums = [Int]()
var lifeNum = 0
var signNum = 0


class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkButton.isEnabled = false
    }
    
    func setDate(){
        let dateComponent = Calendar.current.dateComponents(in: TimeZone.current, from: datePicker.date)
        date = String(dateComponent.day!)
        year = String(dateComponent.year!)
        month = String(dateComponent.month!)
    }
    
    func calculateLifeNum() {
        giftNums.removeAll()
        allNums.removeAll()
        
        lifeNum = 0
        var giftNum = 0
        birthNum = 0
        
        
        for num in year{
            giftNum += Int(String(num))!
            if num != "0" {
                allNums.append(Int(String(num))!)
            }
            
        }
        
        for num in month {
            giftNum += Int(String(num))!
            if num != "0" {
                allNums.append(Int(String(num))!)
            }
        }
        
        for num in date {
            giftNum += Int(String(num))!
            birthNum += Int(String(num))!
            greaterThanTen(num: &birthNum)
            
            if num != "0" {
                allNums.append(Int(String(num))!)
            }
        }
        
        
        
        for num in giftNum.description {
            
            if num != "0" {
                giftNums.append(Int(String(num))!)
            }
           
        }
        
        for num in 0...allNums.count-1 {
            lifeNum += allNums[num]
            print(lifeNum)
        }
        
        greaterThanTen(num: &lifeNum)
        
    }
    
    func greaterThanTen( num: inout Int){
        while num >= 10 {
            let oldNum = num
            num = 0
            
            for i in String(oldNum) {
                    num += Int(String(i))!
            }
        }
    }
    
    @objc @IBAction func setDate(_ sender: UIDatePicker) {
        
        checkButton.isEnabled = true
        
        setDate()
        calculateLifeNum()
        
        let day = Int(date)
        
        switch month {
        case "3":
           
            if day! <= 21 {
                sign = "Pisces"
            } else if day! > 21 {
                signNum = 1
                sign = "Aries"
            }
        case "4":
            
            if day! <= 19 {
                signNum = 1
                sign = "Aries"
            } else if day! >= 20 {
                sign = "Taurus"
                signNum = 2
            }
        case "5":
           
            if day! <= 20 {
                sign = "Taurus"
                signNum = 2
            } else if day! >= 21 {
                sign = "Gemini"
                signNum = 3
            }
        case "6":
            
            if day! <= 21 {
                sign = "Gemini"
                signNum = 3
            } else if day! > 21 {
                sign = "Cancer"
                signNum = 4
            }
        case "7":
            
            if day! <= 22{
                sign = "Cancer"
                signNum = 4
            } else if day! > 22 {
                sign = "Leo"
                signNum = 5
            }
        case "8" :
            
            if day! <= 22 {
                sign = "Leo"
                signNum = 5
            } else if day! > 22 {
                sign = "Virgo"
                signNum = 6
            }
        case "9":
            
            if day! <= 22 {
                sign = "Virgo"
                signNum = 6
            } else if day! > 22 {
                sign = "Libra"
                signNum = 7
            }
        case "10":
            
            if day! <= 23 {
                sign = "Libra"
                signNum = 7
            } else if day! > 23 {
                sign = "Scorpio"
                signNum = 8
            }
        case "11":
            
            if day! <= 22 {
                sign = "Scorpio"
                signNum = 8
            } else if day! > 22 {
                sign = "Sagittarius"
                signNum = 9
            }
        case "12":
            
            if day! <= 21 {
                sign = "Sagittarius"
                signNum = 9
            } else if day! > 21 {
                sign = "Capricorn"
                signNum = 1
            }
        case "1":
            
            if day! <= 20 {
                sign = "Capricon"
                signNum = 1
            } else if day! > 20 {
                sign = "Aquarius"
                signNum = 2
            }
        case "2":
            
            if day! <= 18 {
                sign = "Aquarius"
                signNum = 2
            } else if day! > 18 {
                sign = "Pisces"
                signNum = 3
            }
        default:
            print("Something Went Wrong")
        }
        
    }
    

}


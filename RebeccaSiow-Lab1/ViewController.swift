//
//  ViewController.swift
//  RebeccaSiow-Lab1
//
//  Created by Rebecca Siow on 9/11/16.
//  Copyright © 2016 Rebecca Siow. All rights reserved.
//

import UIKit

//Starts off with 0.00 for price, 
//can i make it so the decimal point is static
//the numbers will correspond to changing the background color
//how to get when numbers are entered?


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var originalPrice: UITextField!
    
    @IBOutlet weak var discount: UITextField!

    @IBOutlet weak var salesTax: UITextField!
    
    @IBOutlet weak var finalPriceValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalPrice.delegate = self
        discount.delegate = self
        salesTax.delegate = self
        
        print("hello")
        
        finalPriceValue.text = "0.00"
        
        originalPrice.placeholder = "0.00"
        discount.placeholder = "0.00"
        salesTax.placeholder = "0.00"
        
        originalPrice.clearsOnBeginEditing = true
        discount.clearsOnBeginEditing = true
        salesTax.clearsOnBeginEditing = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func colorChanged(sender: UITextField) {
        
        //Pop Up for invalid characters
        let alertController = UIAlertController(title: nil, message: "STOP: Enter numbers from 0-9 with 1 decimal point.", preferredStyle: .ActionSheet)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
        }
        alertController.addAction(OKAction)

        //guard removes null pointer exceptions, and unwraps optional
        //if not a number:call pop up
        guard let number = sender.text else {
            print("alphabet")
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        if sender.text?.isEmpty == true {
            sender.text = "0.00"
            return
        }

        //find the last character of the string
        let lastChar = number.characters.last!
        
        let numberColour = lastChar

        print("colour is changing to \(numberColour)")
        
        if numberColour == "0"{
            view.backgroundColor = UIColor.brownColor()
        }
        else if numberColour == "1"{
            view.backgroundColor = UIColor.magentaColor()
        }
        else if numberColour == "2"{
            view.backgroundColor = UIColor.blueColor()
        }
        else if numberColour == "3"{
            view.backgroundColor = UIColor.redColor()
        }
        else if numberColour == "4"{
            view.backgroundColor = UIColor.blackColor()
        }
        else if numberColour == "5"{
            view.backgroundColor = UIColor.yellowColor()
        }
        else if numberColour == "6"{
            view.backgroundColor = UIColor.cyanColor()
        }
        else if numberColour == "7"{
            view.backgroundColor = UIColor.orangeColor()
        }
        else if numberColour == "8"{
            view.backgroundColor = UIColor.purpleColor()
        }
        else if numberColour == "9"{
            view.backgroundColor = UIColor.greenColor()
        }
        else if numberColour == "."{
        
            let array = sender.text?.componentsSeparatedByString(".")
            if (array?.count > 2){
                print("more than 2 things in the array split by decimals")
                self.presentViewController(alertController, animated: true, completion: nil)
                
                //removes last invalid character
                sender.text = sender.text?.substringToIndex((sender.text?.endIndex.predecessor())!)
                return
            }
        }
        else {
            print("alphabet or anything else")
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            //remove last invalid character
            sender.text = sender.text?.substringToIndex((sender.text?.endIndex.predecessor())!)
            
            //if empty string, replace with 0.00
            if sender.text?.isEmpty == true {
                sender.text = "0.00"
                
            }
        }
        
        guard let originalPriceCheck = originalPrice.text else {
            self.presentViewController(alertController, animated: true, completion: nil)
            sender.text = "0.00"
            return
        }
        
        guard let discountCheck = discount.text else{
            self.presentViewController(alertController, animated: true, completion: nil)
            sender.text = "0.00"
            return
        }
        guard let salesTaxCheck = salesTax.text else{
            self.presentViewController(alertController, animated: true, completion: nil)
            sender.text = "0.00"
            return
        }
        
        guard let originalPriceValue = Double(originalPriceCheck) else {
            return
        }
        guard let discountValue = Double(discountCheck) else {
            return
        }
        guard let salesTaxValue = Double(salesTaxCheck) else {
            return
        }
        
        let discountedPrice = (1.0 - discountValue/100)*originalPriceValue
        
        let finalPrice = discountedPrice*(1+salesTaxValue/100)
        
        let displayText = "$\(String(format: "%.2f", finalPrice))"
        
        finalPriceValue.text = String(displayText)
    }
}

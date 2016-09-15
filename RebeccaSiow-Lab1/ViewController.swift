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
        
        //Checks: If the textfield is empty, make string == 0
        finalPriceValue.text = "0.00"
        originalPrice.text = "0.00"
        discount.text = "0.00"
        salesTax.text = "0.00"
        
        originalPrice.clearsOnBeginEditing = true
        discount.clearsOnBeginEditing = true
        salesTax.clearsOnBeginEditing = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func changeColor(number: Double){
        //let colorGradient = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if number == 1{
            view.backgroundColor = UIColor.brownColor()
        }
        if number == 1{
            view.backgroundColor = UIColor.magentaColor()
        }
        if number == 2{
            view.backgroundColor = UIColor.blueColor()
        }
        if number == 3{
            view.backgroundColor = UIColor.redColor()
        }
        if number == 4{
            view.backgroundColor = UIColor.blackColor()
        }
        if number == 5{
            view.backgroundColor = UIColor.yellowColor()
        }
        if number == 6{
            view.backgroundColor = UIColor.cyanColor()
        }
        if number == 7{
            view.backgroundColor = UIColor.orangeColor()
        }
        if number == 8{
            view.backgroundColor = UIColor.purpleColor()
        }
        if number == 9{
            view.backgroundColor = UIColor.greenColor()
        }
    }

    @IBAction func colorChanged(sender: UITextField) {
        if sender.text?.isEmpty == true {
            sender.text = "0.00"

        }
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
            print("too many decimal points")
        
            //let array = Array(arrayLiteral: sender.text!)
            let array = sender.text?.componentsSeparatedByString(".")
            if (array?.count > 2){
                print("more than 2 things in the array split by decimals")
                print("too many decimal points")
                self.presentViewController(alertController, animated: true, completion: nil)
                sender.text = sender.text?.substringToIndex((sender.text?.endIndex.predecessor())!)
                return
            }
        }
        else {
            print("alphabet")
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            //remove last invalid character
            sender.text = sender.text?.substringToIndex((sender.text?.endIndex.predecessor())!)
            
            //sender.text = "0.00"
            
        }
        
        guard let originalPriceCheck = originalPrice.text else {
            print("alphabet")
            let alertController = UIAlertController(title: nil, message: "STOP: Enter numbers from 0-9.", preferredStyle: .ActionSheet)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            sender.text = "0.00"
            return
        }
        
        guard let discountCheck = discount.text else{
            print("alphabet")
            let alertController = UIAlertController(title: nil, message: "STOP: Enter numbers from 0-9.", preferredStyle: .ActionSheet)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            sender.text = "0.00"
            return
        }
        guard let salesTaxCheck = salesTax.text else{
            print("alphabet")
            let alertController = UIAlertController(title: nil, message: "STOP: Enter numbers from 0-9.", preferredStyle: .ActionSheet)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
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
        
        //let originalPriceValue: Double = Double(originalPrice.text!)!
        /**
        let discountValue: Double = Double(discount.text!)!
        let salesTaxValue: Double = Double(salesTax.text!)!
 **/
        
        let discountedPrice = (1.0 - discountValue/100)*originalPriceValue
        
        let finalPrice = discountedPrice*(1+salesTaxValue/100)
        
        let displayText = "$\(String(format: "%.2f", finalPrice))"
        
        finalPriceValue.text = String(displayText)

        
    }

    @IBAction func numberColors(sender: UITextField) {

        
        /**
        
        
        number = Double(number)
        
        if let number = Double(text){
            changeColor(number)
            return true
        }

        Double()
        
        if let number = sender.text{
            changeColor(Double(number)!)
        }
        
        changeColor()
         **/
    }
    /**
    func textViewShouldBeginEditing(textView: UITextField) -> Bool {
        textView.selectedTextRange = textView.textRangeFromPosition(textView.beginningOfDocument, toPosition: textView.endOfDocument)
        dispatch_async(dispatch_get_main_queue()) {
            textView.selectAll(nil)
        }
        return true
    }
 **/
    
    /**
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //replacement string is what is typed, empty means backspace
        
        if string.isEmpty{
            return true
        }

        
        let text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        //guard removes null pointer exceptions
        //if not a number:call pop up
        guard let number = Double(text) else {
            print("alphabet")
            let alertController = UIAlertController(title: nil, message: "STOP: Enter numbers from 0-9.", preferredStyle: .ActionSheet)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
            return false
        
        }
        
        //changeColor(number)
        
        return true
        
    }
    **/
    
    /**
     Safely testing existence : if opt != nil { ... someFunc(opt!) ... } // no error
     Safely unwrapping via binding: if let x = opt { ... someFunc(x) ... } // no error
     Safely chaining: var x = opt?.property // x is also Optional, by extension
     Safely coalescing nil values: var x = opt ?? nonOpt
     **/
    
    func updateFinalPrice(sender: UITextField) {
        /**
         var decimalArray = sender.text?.characters.split(<#T##separator: Character##Character#>) {
         separator = "."
         }
         **/
        
        //if empty string, replace with 0.00
        if ((sender.text?.isEmpty) == true){
            sender.text = "0.00"
        }
        
        //unwraps the originalPrice as the originalPriceCheck
        /**
         guard let originalPriceValueCheck = originalPrice.text else {
         //if originalPrice is nil
         //reprompt
         }
         **/
        //if there is something in originalPrice
        
        let originalPriceValue: Double = Double(originalPrice.text!)!
        let discountValue: Double = Double(discount.text!)!
        let salesTaxValue: Double = Double(salesTax.text!)!
        
        let discountedPrice = (1.0 - discountValue/100)*originalPriceValue
        
        let finalPrice = discountedPrice*(1+salesTaxValue/100)
        
        let displayText = "$\(String(format: "%.2f", finalPrice))"
        
        finalPriceValue.text = String(displayText)

        /**
        if originalPrice.text != nil{
            if discount.text != nil{
                if salesTax.text != nil{
                    if originalPrice.text != nil{
                        if discount.text != nil{
                            if salesTax.text != nil{
                    
                    let originalPriceValue: Double = Double(originalPrice.text!)!
                    let discountValue: Double = Double(discount.text!)!
                    let salesTaxValue: Double = Double(salesTax.text!)!
                    
                    
                    let discountedPrice = (1.0 - discountValue/100)*originalPriceValue
                    
                    let finalPrice = discountedPrice*(1+salesTaxValue/100)
                    
                    finalPriceValue.text = String(finalPrice)
                    
                }
            }
                    }
                }
            }
        }
         **/
        
}
}

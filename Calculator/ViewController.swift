//
//  ViewController.swift
//  Calculator
//
//  Created by xzhflying on 15/11/5.
//  Copyright © 2015年 xzhflying. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInputing: Bool = false
    
    var theCore = CalculatorCore()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = firstButtonValue(sender.currentTitle!)
        appendToLabel(digit)
    }
    
    @IBAction func addButtonOptionalValue(sender :UILongPressGestureRecognizer) {
        if(sender.state == .Ended)
        {
            appendToLabel("(")
        }
    }
    
    @IBAction func minusButtonOptionalValue(sender :UILongPressGestureRecognizer) {
        if(sender.state == .Ended)
        {
            appendToLabel(")")
        }
    }
    
    @IBAction func clearInput(sender: UIButton) {
        display.text = "0"
        userIsInputing = false
        theCore.digitStack.removeAll()
        theCore.operatorStack.removeAll()
    }
    
    @IBAction func deleteLastInput(sender: UIButton) {
        if (userIsInputing && display.text!.characters.count > 1)
        {
            display.text!.removeAtIndex(display.text!.endIndex.predecessor())
        }
        else if (userIsInputing)
        {
            display.text! = "0"
            userIsInputing = false
        }
    }
    
    @IBAction func theResult(sender: AnyObject) {
        let result = theCore.calculate()
        if result != nil
        {
            display.text = String(result!)
        }
    }
    
    func appendToLabel(str :String){
        if( userIsInputing )
        {
            display.text = display.text! + str
        }
        else
        {
            display.text = str
            userIsInputing = true
        }
    }
    
    func firstButtonValue(str :String) -> String{
        if (str.containsString("/"))
        {
            let index = str.startIndex.advancedBy(1)
            return str.substringToIndex(index)
        }
       else
        {
            return str
        }
    }
    
    // Unused for now
    func secondButtonValue(str :String) -> String?{
        if (str.containsString("/"))
        {
            let startIndex = str.startIndex.advancedBy(1)
            let endIndex = str.startIndex.advancedBy(2)
            let range = Range(start: startIndex, end: endIndex)
            return str.substringWithRange(range)
        }
        else
        {
            return nil
        }
    }
}


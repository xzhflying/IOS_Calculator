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
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if( userIsInputing )
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text = digit
            userIsInputing = true
        }
    }
}


//
//  Operator.swift
//  Calculator
//
//  Created by xzhflying on 15/11/9.
//  Copyright © 2015年 xzhflying. All rights reserved.
//

import Foundation

class Operator {
    let op :String
    
    init(op :String) {
        self.op = op
    }
    
    func getPriority()-> Int{
        switch self.op{
        case "+": return 1
        case "-": return 1
        case "*": return 2
        case "/": return 2
        case "⋀": return 3
        case "√": return 3
        case "(": return 4
        case ")": return 4
        default: return 0
        }
    }
}
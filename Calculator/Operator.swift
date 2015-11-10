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
    
    func getByString() -> String{
        return op
    }
    
    func getPriority() -> Int{
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
    
    func comparePriority(op :Operator) -> Int{
        let priority1 = self.getPriority()
        let priority2 = op.getPriority()
        if (priority1 > priority2)
        {
            return 1
        }
        else if (priority1 < priority2)
        {
            return -1
        }
        else
        {
            return 0
        }
    }
}
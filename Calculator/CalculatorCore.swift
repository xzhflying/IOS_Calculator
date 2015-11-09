//
//  CalculatorCore.swift
//  Calculator
//
//  Created by xzhflying on 15/11/9.
//  Copyright © 2015年 xzhflying. All rights reserved.
//

import Foundation

class CalculatorCore{
    let operators = ["+","-","*","/","∧","√","(",")"]
    
    var digitStack :Array<Double>
    var operatorStack :Array<String>
    
    enum Expression{
        case Operator(String)
        case Number(Double)
    }
    
    init(){
        digitStack = Array<Double>()
        operatorStack = Array<String>()
    }
    
    func calculate() -> Double?{
        while(!operatorStack.isEmpty && !digitStack.isEmpty)
        {
            let op :String =  operatorStack.removeLast()
            switch op{
            case "+":
                let digit1 :Double = digitStack.removeLast()
                let digit2 :Double = digitStack.removeLast()
                digitStack.append(digit1+digit2)
            default: break
            }
        }
        
        if(digitStack.count == 1)
        {
            return digitStack.last
        }
        return nil
    }
    
    func analyseExpression() -> Bool
    {
     return true
    }
    
    func comparePriority(op1 :Expression.Operator, op2 :Expression.Operator) -> Int{
        let priority1 = op1.getPriority()
        let priority2 = op2.getPriority()
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

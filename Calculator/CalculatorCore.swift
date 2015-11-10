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
    var operatorStack :Array<Operator>
    
    enum Expression{
        case TheOperator(Operator)
        case TheNumber(Double)
    }
    
    init(){
        digitStack = Array<Double>()
        operatorStack = Array<Operator>()
    }
    
    func calculate() -> Double?{
        while(!operatorStack.isEmpty && !digitStack.isEmpty)
        {
            let op :Operator =  operatorStack.removeLast()
            switch op.getByString(){
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
}

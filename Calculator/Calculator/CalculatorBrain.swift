//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Huang Huang on 3/3/17.
//  Copyright © 2017 BenjaminHuang. All rights reserved.
//

import Foundation

internal class CalculatorBrain
{
    private var accumulator:Double = 0.0
    
    var result:Double{
        get{
            return accumulator
        }
    }
    func setOperand(operand: Double){
        accumulator = operand
    }
    var operations: Dictionary<String, Operation>=[
        "π":Operation.Constant,//M_PI,
        "e":Operation.Constant,//M_E,
        "√":Operation.UnaryOperation,//sqrt,
        "cos": Operation.UnaryOperation//cos,
        
        
    ]
    
    enum Operation{
        case Constant
        case UnaryOperation
        case BinaryOperation
        case Equals
    }
    
    func performOperation(symbol: String)
    {
        //bypass the case can not orgnize the symbol
        if let option = operations[symbol]{
            switch option {
            case .Constant:
                break
            case .UnaryOperation:
                break
            case .BinaryOperation:
                break
            case .Equals:
                break
            default:
                <#code#>
            }
        }
//        switch symbol {
//        case "π":
//            accumulator = M_PI
//        case "√":
//            accumulator = sqrt(accumulator)
//        default:
//            break
//        }
    }
}

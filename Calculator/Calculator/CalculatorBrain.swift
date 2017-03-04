//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Huang Huang on 3/3/17.
//  Copyright © 2017 BenjaminHuang. All rights reserved.
//

import Foundation

func multiply(op1: Double, op2:Double) -> Double{
    return op1 * op2
}

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
        "π":Operation.Constant(M_PI),
        "e":Operation.Constant(M_E),
        "√":Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "x": Operation.BinaryOperation(multiply),
        "=": Operation.Equals
        
        
    ]
    
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double, Double)->Double)
        case Equals
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo{
        var binaryFunction:(Double, Double)->Double
        var firstOperand: Double
    }
    func performOperation(symbol: String)
    {
        //bypass the case can not orgnize the symbol
        if let option = operations[symbol]{
            switch option {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let fun):
                accumulator = fun(accumulator)
            case .BinaryOperation(let fun):
                pending = PendingBinaryOperationInfo(binaryFunction:fun, firstOperand: accumulator)
            case .Equals:
                if pending != nil
                {
                    accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                }
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

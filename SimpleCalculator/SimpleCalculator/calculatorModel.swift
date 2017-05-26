//
//  calculatorModel.swift
//  SimpleCalculator
//
//  Created by Nabendu Biswas on 22/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import Foundation

class calculatorModel {
    
    var total = 0.0
    typealias binaryOperationType = (_ number1:Double, _ number2:Double) -> Double
    
    struct pendingBinaryOperation {
        var firstNumber: Double
        var executeOperationFunction: binaryOperationType
    }
    
    var pendingOperation: pendingBinaryOperation?
    
    var result:Double{
        get{ return total}
    }
    
    func executeOperation(){
        if pendingOperation != nil {
            total = pendingOperation!.executeOperationFunction(pendingOperation!.firstNumber, total)
            pendingOperation != nil
        }
    }
    
    func setFirstValue(_ firstValue:Double){
        total = firstValue
    }
    
    func performOperation(operation: String){
        switch operation{
        case "+":
            executeOperation()
            pendingOperation = pendingBinaryOperation(firstNumber: total, executeOperationFunction: { ($0 + $1) })
            
        case "−":
            executeOperation()
            pendingOperation = pendingBinaryOperation(firstNumber: total, executeOperationFunction: { ($0 - $1) })
        case "÷":
            executeOperation()
            pendingOperation = pendingBinaryOperation(firstNumber: total, executeOperationFunction: { ($0 / $1) })
        case "×":
            executeOperation()
            pendingOperation = pendingBinaryOperation(firstNumber: total, executeOperationFunction: { ($0 * $1) })
        case "%":
            executeOperation()
            pendingOperation = pendingBinaryOperation(firstNumber: total, executeOperationFunction: { ($0 * ($1/100)) })
        case "±": total = -total
        case "AC": total = 0
        case "=": executeOperation()
        default: break
            
        }
        

    
    }

    
    func clearNumbers() -> Double{
        return 0
        
    }
    
    
}

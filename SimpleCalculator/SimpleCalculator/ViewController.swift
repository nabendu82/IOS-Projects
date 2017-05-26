//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Nabendu Biswas on 18/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calcModel = calculatorModel()
    var numberOne:Double?
    var oldOperator:String!
    var isNewValue = true
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    @IBAction func ketPressed(_ sender: UIButton) {
        if isNewValue{
            calculatorDisplay.text! = sender.titleLabel!.text!
            isNewValue = false
        } else {
            calculatorDisplay.text! += sender.titleLabel!.text!
        }

    }
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if !isNewValue{
            calcModel.setFirstValue(Double(calculatorDisplay.text!)!)
        }
        calcModel.performOperation(operation: sender.titleLabel!.text!)
        calculatorDisplay.text = String(calcModel.result)
        isNewValue = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


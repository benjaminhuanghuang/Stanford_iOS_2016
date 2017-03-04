//
//  ViewController.swift
//  Calculator
//
//  Created by Huang Huang on 3/3/17.
//  Copyright © 2017 BenjaminHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping : Bool = false
    
    
    @IBAction func touchDigit(_ sender: UIButton)
    {
        //let digit = sender.currentTitle
        //print("touched \(digit) digit")   //touched Optional("5") digit
        let digit = sender.currentTitle!
        //print("touched \(digit) digit")
        
        if userIsInTheMiddleOfTyping
        {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
    }
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton)
    {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displyValue)
            userIsInTheMiddleOfTyping = false

        }
        
        if let mathmaticalSymbole = sender.currentTitle{
            brain.performOperation(symbol: mathmaticalSymbole)
        }
        displyValue = brain.result
        
//        if mathmaticalSymbole == "π"{
//            displyValue = M_PI
//        }
//        else if mathmaticalSymbole == "√"{
//            displyValue = sqrt(displyValue)
//        }
        
    }
    
    //properties
    var displyValue : Double{
        get
        {
            // add ! at the end using a optional double variable, because
            // display.text! can be a string can not be convert to double
            return Double(display.text!)!
        }
        set
        {
            display.text = String(newValue)
        }
    }
}


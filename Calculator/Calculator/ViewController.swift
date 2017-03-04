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
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        let mathmaticalSymbole = sender.currentTitle!
        if mathmaticalSymbole == "π"{
            display.text = String(M_PI)
        }
        
    }
}


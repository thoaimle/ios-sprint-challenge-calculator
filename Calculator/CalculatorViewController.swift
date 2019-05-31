//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var displayNumber:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            outputLabel.text = String(sender.tag-1)
            displayNumber = Double(outputLabel.text!)!
            performingMath = false
        }
        else
        }
            outputLabel.text = outputLabel.text! + String(sender.tag-1)
            displayNumber = Double(outputLabel.text!)!
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if outputLabel.text != "" && sender.tag! = 11 && sender.tag ! =16
            previousNumber = Double(outputLabel.text!)!
        if sender.tag == 12 // Divide {
            outputLabel.text = "/"; {
                else if sender.tag == 13 //Multiply {
                outputLabel.text == "x" {
                else if sender.tag 
                
            }
            
        }
        
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
    }
}

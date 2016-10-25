//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/25/16.
//  Copyright © 2016 iGuest. All rights reserved.
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

    @IBOutlet var wholeApp: UIView!
    
    @IBOutlet weak var textArea: UILabel!
    
    var hasOperator = false

    @IBAction func buttonTouch(_ sender: AnyObject) {
        let current = sender.titleLabel!!.text!
        let lastInput = self.textArea.text!
        self.textArea.text = "\(lastInput)\(current)"
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        if(!hasOperator){
            hasOperator = !hasOperator
        
            let current = sender.titleLabel!!.text!
            let lastInput = self.textArea.text!
            self.textArea.text = "\(lastInput) \(current) "
        }
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        clear()
    }
    
    func clear(){
        hasOperator = false
        self.textArea.text = ""
    }
    
    @IBAction func enterCommand(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        print(expressionArray)
        clear()
        if(expressionArray.count == 3){
            let currentOperator = expressionArray[1]
            
        
            let first: Int = Int(expressionArray[0])!
            let second : Int = Int(expressionArray[2])!
            var result = 0
            switch currentOperator {
            case "+":
                result = first + second
            case "-":
                result = first - second
            case "*":
                result = first * second
            case "/":
                result = first / second
            case "%":
                result = first % second
            default:
                result = -1
            }
            self.textArea.text = "\(result)"
        }
        
    }
    
    @IBAction func addSpace(_ sender: AnyObject) {
        hasOperator = true
        let lastInput = self.textArea.text!
        self.textArea.text = "\(lastInput) "
    }
    
    @IBAction func factorial(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        if(expressionArray.count == 1){
            let num : Int = Int(expressionArray[0])!
            var result = 1
            for i in 1...num {
                result *= i
            }
            self.textArea.text = "\(result)"
        }
    }
    
    @IBAction func count(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        self.textArea.text = "\(expressionArray.count)"
    }
    
    @IBAction func avg(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        let count = expressionArray.count
        
        var result = 0
        for i in 0...count {
            result += i
        }
        self.textArea.text = "\(result / count)"
    }
}


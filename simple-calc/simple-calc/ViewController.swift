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

    @IBAction func buttonTouch(_ sender: AnyObject) {
        let current = sender.titleLabel!!.text!
        let lastInput = self.textArea.text!
        self.textArea.text = "\(lastInput)\(current)"
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        let current = sender.titleLabel!!.text!
        let lastInput = self.textArea.text!
        self.textArea.text = "\(lastInput) \(current) "
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        self.textArea.text = ""
    }
}


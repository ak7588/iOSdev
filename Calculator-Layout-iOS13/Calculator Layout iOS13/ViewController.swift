//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var isFinishedTyping = true
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        guard let number = Double(textLabel.text!)! else {
            fatalError()
        }
        
        var operation = sender.currentTitle!
        if operation == "+" {
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                textLabel.text = numValue
                isFinishedTyping = false
            } else {
                textLabel.text! += numValue
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


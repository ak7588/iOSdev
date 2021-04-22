//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipPercentage: Float?
    var stepperValue: Int?
    var resultAmount: Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender == zeroButton {
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
            tipPercentage = 0.0
        } else if sender == tenButton {
            zeroButton.isSelected = false
            tenButton.isSelected = true
            twentyButton.isSelected = false
            tipPercentage = 0.1
        } else if sender == twentyButton {
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = true
            tipPercentage = 0.2
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        if Int(sender.value) > stepperValue! {
            stepperValue! += 1
        } else {
            stepperValue! -= 1
        }
        splitLabel.text = String(stepperValue!)
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        let total = Float(billTextField.text!)!
        let tip = tipPercentage!
        let split = Float(stepperValue!)
        resultAmount = (total + total * tip) / split
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResults") {
            let destination = segue.destination as! ResultsVC
            destination.splitAmount = resultAmount!
            destination.numPeople = stepperValue!
            destination.tip = Int(tipPercentage! * 100)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepperValue = Int(splitLabel.text!)
        tenButton.isSelected = false
        zeroButton.isSelected = false
        twentyButton.isSelected = false
    }
}


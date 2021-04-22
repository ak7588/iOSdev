//
//  ResultsVCViewController.swift
//  Tipsy
//
//  Created by Amina on 4/22/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    var splitAmount: Float?
    var numPeople: Int = 0
    var tip: Int = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = String(splitAmount!)
        settingsLabel.text = "Split between " + String(numPeople) + " people, with " + String(tip) + "% tip."
    }
    

}

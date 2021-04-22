//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Amina on 4/20/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UITableViewController {
    
    var bmi: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var BMILabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBAction func recalcButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BMILabel.text = bmi
        adviceLabel.text = advice
        view.backgroundColor = color
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

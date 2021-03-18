//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // do this by pressing ctrl + drag to here
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    // do this when opening the app
    override func viewDidLoad() {
        super.viewDidLoad()
        // who.what = behavior
        diceImageViewOne.image = #imageLiteral(resourceName: "DiceSix")
        diceImageViewTwo.image = #imageLiteral(resourceName: "DiceTwo")
    }
    
    // do this when btn is pressed
    @IBAction func buttonPressed(_ sender: UIButton) {
        diceImageViewOne.image = #imageLiteral(resourceName: "DiceFour")
        diceImageViewTwo.image = #imageLiteral(resourceName: "DiceFour")
        print("Button Pressed")
    }
    
}


//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    var counter = 0
    var timer = Timer()
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
       let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }


    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound(title: "alarm_sound")
        }
    }
    
    func playSound(title: String) {
        let url = Bundle.main.url(forResource: title, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

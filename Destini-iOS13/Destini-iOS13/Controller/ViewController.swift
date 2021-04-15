//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    @IBAction func choiceMade(_ sender: UIButton) {
        updateUI(storyBrain.nextStory(sender.currentTitle!))
    }
    
    func updateUI(_ storiesCount: Int){
        storyLabel.text = storyBrain.stories[storiesCount].title
        choice1Button.setTitle(storyBrain.stories[storiesCount].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[storiesCount].choice2, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storyBrain.stories[storyBrain.storiesCount].title
        choice1Button.setTitle(storyBrain.stories[storyBrain.storiesCount].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[storyBrain.storiesCount].choice2, for: .normal)
    }
}


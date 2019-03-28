//
//  WelcomeViewController.swift
//  BullsEye
//
//  Created by Robert Morrow on 3/25/19.
//  Copyright © 2019 Robert Morrow. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var showHighScoreButtonOutlet: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var isCheaterModeOn = false
    var isShowingHighScore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: IBActions

    @IBAction func playButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "welcomeToGameSegue", sender: self)
    }
    
    @IBAction func cheaterSwitchValueUpdated(_ sender: UISwitch) {
        print(sender.isOn)
        isCheaterModeOn = sender.isOn
    }
    
    @IBAction func showHighScore(_ sender: Any) {
        
        isShowingHighScore = !isShowingHighScore
        if isShowingHighScore {
            showHighScoreButtonOutlet.setTitle("Hide High Score", for: .normal)
            let userDefaultScore = UserDefaults.standard.double(forKey: "myHighestScore")
            scoreLabel.text = String(format: "Score: %.2f", userDefaultScore)
        } else {
            showHighScoreButtonOutlet.setTitle("Show Highest Score", for: .normal)
            scoreLabel.text = ""
        }
        
    
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "welcomeToGameSegue" {
            let gameVC = segue.destination as! BullsEyeViewController
            gameVC.isCheaterModeOn = isCheaterModeOn
            self.present(gameVC, animated: true, completion: nil)
        }
    }
    


}

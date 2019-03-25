//
//  WelcomeViewController.swift
//  BullsEye
//
//  Created by Robert Morrow on 3/25/19.
//  Copyright © 2019 Robert Morrow. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var isCheaterModeOn = false
    
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
        print("Is Cheater Mode On? \(isCheaterModeOn)")
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

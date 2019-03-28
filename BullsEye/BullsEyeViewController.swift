//
//  BullsEyeViewController.swift
//  BullsEye
//
//  Created by Robert Morrow on 3/25/19.
//  Copyright © 2019 Robert Morrow. All rights reserved.
//

import UIKit

class BullsEyeViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var readyButtonOutlet: UIButton!
    
    var randomNumber = 0.0
    var isCheaterModeOn : Bool?
    var highestScore : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateRandomNumber()
        targetLabel.text = String(format: "Your target is: %.2f", randomNumber)
    }
    
    //MARK: IBActions
    @IBAction func readyButtonPressed(_ sender: Any) {
        checkTarget(target: randomNumber, result: Double(sliderOutlet.value))
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if isCheaterModeOn != nil {
            if isCheaterModeOn == true {
                resultLabel.text = String(format: "%.2f", sender.value)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: HelperFunctions
    
    func checkTarget(target: Double, result: Double) {
        
        let startingPoint = target - 4.0
        let endPoint = target + 4.0
        
        if (result >= startingPoint) && (result <= endPoint) {
            
            getCurrentHighScore(target: target, result: result)
            
            showResult(title: "Bull's EYE!!!", message: String(format: "You hit %.2f", sliderOutlet.value))
        } else {
            showResult(title: "Looser!!!", message: String(format: "You hit %.2f", sliderOutlet.value))
        }
        
    }
    
    func generateRandomNumber() {
        randomNumber = Double.random(in: 0...100)
    }

    func updateUI() {
        generateRandomNumber()
        targetLabel.text = String(format: "Your target is: %.2f", randomNumber)
        sliderOutlet.value = 0
        
        
    }
    
    func showResult(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.updateUI()
        }
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getCurrentHighScore(target: Double, result: Double) {
        var currentScore : Double!
        
        if target < result {
            currentScore = result - target
        } else {
            currentScore = target - result
        }
        
        compareHighScore(currentScore: currentScore)
    }
    
    func compareHighScore(currentScore: Double) {
        
        if highestScore != nil {
            if highestScore! > currentScore {
                highestScore = currentScore
                showResult(title: "New Record!", message: String(format: "Your new record is: %.2f", highestScore!))
                
                UserDefaults.standard.set(highestScore!, forKey: "myHighestScore")
                UserDefaults.standard.synchronize()
            }
        } else {
            highestScore = currentScore
        }
    }
    
}

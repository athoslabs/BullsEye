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
        
        let startingPoint = target - 2.0
        let endPoint = target + 2.0
        
        if (result >= startingPoint) && (result <= endPoint) {
            showResult(title: "Bull's EYE!!!", message: String(format: "You hit %.2f", sliderOutlet.value))
        } else {
            showResult(title: "Looser!!!", message: String(format: "You hit %.2f", sliderOutlet.value))
        }
        
    }
    
    func generateRandomNumber() {
        randomNumber = Double.random(in: 0...100)
        print("Random Number: \(randomNumber)")
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
    
}

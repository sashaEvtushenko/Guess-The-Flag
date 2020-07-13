//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Sasha Evtushenko on 7/12/20.
//  Copyright © 2020 Sasha Evtushenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.systemGray.cgColor
        button2.layer.borderColor = UIColor.systemGray.cgColor
        button3.layer.borderColor = UIColor.systemGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        navigationItem.rightBarButtonItem?.title = "Tap For Score"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            score += 1
        } else {
            score -= 1
            let alertController = UIAlertController(title: "Wrong", message: "Your choice was the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            present(alertController, animated: true)
        }
        
        questionCounter += 1
        
        if questionCounter == 10 {
            let alertController = UIAlertController(title: "The End", message: "Your final score is \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)
            
            questionCounter = 0
            score = 0
        }

        askQuestion()
    }
    
    @IBAction func showScoreTapped(_ sender: UIBarButtonItem) {
        navigationItem.rightBarButtonItem?.title = "Score: \(score)"
    }
}


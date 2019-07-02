//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Akash Agrawal on 27/06/19.
//  Copyright © 2019 Akash Agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var moveCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {

        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) | Score: \(score)"
    }
    
    func endTurn(action: UIAlertAction! = nil) {
        if self.moveCounter >= 10 {
            let ac = UIAlertController(title: "Finished", message: "Your final score is \(self.score)", preferredStyle: .alert)
            score = 0
            ac.addAction(UIAlertAction(title: "Start New", style: .default, handler: askQuestion))
            self.present(ac, animated: true)
        } else {
            askQuestion()
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        moveCounter += 1
        if sender.tag == correctAnswer {
            title = "Correct"
            score +=  1
        } else {
            title = "Wrong! That was \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: endTurn))
        present(ac, animated: true)
    }
    
}


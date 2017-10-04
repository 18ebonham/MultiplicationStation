//
//  ViewController.swift
//  Multiplication App
//
//  Created by Hartley Bonham on 9/19/17.
//  Copyright © 2017 Hartley Bonham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var game = Game()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var guess: UITextField!
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var score: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guess.delegate = self
        game.generateQuestion()
        label.text = "Welcome to The Multiplication Station 👋🏻"
        questionText.text = "\(game.firstFactor) x \(game.secondFactor) = "
        score.text = "Score: \(game.count)"
        
        // Do any additional setup after loading the view, typically from a nib.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkAnswerButton(_ sender: UIButton) {
        
        score.text = "Score: \(game.count)"
        
        if let textEntry = guess.text {
            if let guess = Int(textEntry) {
                label.text = game.checkQuestion(guess: guess)
                score.text = "Score: \(game.count)"
            } else {
                //digits only alert
                let alertController = UIAlertController(title: "Woah There!", message:
                    "Please Enter Whole Numbers Only", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        game.generateQuestion()
        questionText.text = "\(game.firstFactor) x \(game.secondFactor) = "
        label.text = "Multiplication Station ✏️"
    }
}

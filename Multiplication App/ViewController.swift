//
//  ViewController.swift
//  Multiplication App
//
//  Created by Hartley Bonham on 9/19/17.
//  Copyright © 2017 Hartley Bonham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var checkAnswerButton: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var guess: UITextField!
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var score: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAnswerButton.isEnabled = true
        guess.delegate = self
        if let parentVC = self.tabBarController as? TabBarViewController {
            parentVC.game.generateQuestion()
            label.text = ""
            questionText.text = "\(parentVC.game.firstFactor) x \(parentVC.game.secondFactor) = "
            score.text = "Score: \(parentVC.game.count) 🏅"
        self.guess.delegate = self //just added this in for hiding the keyboard
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //get rid of keyboard when user touches outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //get rid of keyboard when user presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guess.resignFirstResponder()
        return (true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let answerController = segue.destination as? AnswerViewController {
            if let parentVC = self.tabBarController as? TabBarViewController {
                answerController.firstFactor = parentVC.game.firstFactor
                answerController.secondFactor = parentVC.game.secondFactor
                answerController.answer = parentVC.game.generateAnswer()
            }
        }
    }
    

    @IBAction func checkAnswerButton(_ sender: UIButton) {
        if let parentVC = self.tabBarController as? TabBarViewController {
            score.text = "Score: \(parentVC.game.count)"
            
            if let textEntry = guess.text {
                if let guess = Int(textEntry) {
                    label.text = parentVC.game.checkQuestion(guess: guess)
                    score.text = "Score: \(parentVC.game.count)"
                    if label.text == "That's correct! You are a bonafide genius! 🤓" {
            sender.isEnabled = false
                    }
                } else {
                    //digits only alert
                    let alertController = UIAlertController(title: "Woah There!", message:
                        "Please Enter Whole Numbers Only", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Got It", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        guess.text = ""
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        if let parentVC = self.tabBarController as? TabBarViewController {
        parentVC.game.generateQuestion()
        questionText.text = "\(parentVC.game.firstFactor) x \(parentVC.game.secondFactor) = "
            label.text = "Now try this:"
        guess.text = ""
        checkAnswerButton.isEnabled = true
        }
    }
}


//
//  SettingsViewController.swift
//  Multiplication App
//
//  Created by Hartley Bonham on 10/25/17.
//  Copyright © 2017 Hartley Bonham. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var difficultyLevelSegmentedControl: UISegmentedControl!
   
    @IBAction func saveSettingsButton(_ sender: Any) {
        if let parentVC = self.tabBarController as? TabBarViewController {

            if parentVC.game.difficultyLevel != difficultyLevelSegmentedControl.selectedSegmentIndex {
                parentVC.game.difficultyLevel = difficultyLevelSegmentedControl.selectedSegmentIndex
                UserDefaults.standard.set(0, forKey: "Difficulty Level")
                parentVC.game.generateQuestion()
                if let navigationController = parentVC.childViewControllers[0] as? UINavigationController{
                    if let sibling = navigationController.viewControllers[0] as? ViewController {
                        sibling.questionText.text = "\(parentVC.game.firstFactor) x \(parentVC.game.secondFactor) = "
                        sibling.guess.text = ""
                    }
                }
            }
        }
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        if let difficultyLevel = defaults.object(forKey: "Difficulty Level") as? Int {
            print ("you are cool")
            if let parentVC = self.tabBarController as? TabBarViewController {
                parentVC.game.difficultyLevel = difficultyLevel
            }
        } else {
            print ("first time no defaults")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  AnswerViewController.swift
//  Multiplication App
//
//  Created by Hartley Bonham on 10/13/17.
//  Copyright © 2017 Hartley Bonham. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!

    var firstFactor = 0
    var secondFactor = 0
    var answer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = "\(firstFactor) x \(secondFactor) = \(answer)"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        answerLabel.text = "\(firstFactor) x \(secondFactor) = \(answer)"
        super.viewWillAppear(true)
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

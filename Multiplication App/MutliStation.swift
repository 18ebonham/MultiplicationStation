//
//  main.swift
//  Multiplication Station
//
//  Created by Hartley Bonham on 8/31/17.
//  Copyright © 2017 Hartley Bonham. All rights reserved.
//

import Foundation


class Game {
    var firstFactor = 0
    var secondFactor = 0
    var count = 0
    var difficultyLevel = 0
    
    // generate random factor
    func getFactor() -> Int {
        if (difficultyLevel == 0){
            let factor = Int(arc4random_uniform(10)) + 1
            return factor
        } else {
            let factor = Int(arc4random_uniform(50)) + 1
            return factor
        }
    }
    
    // generate question factors
    func generateQuestion(){
        firstFactor = getFactor()
        secondFactor = getFactor()
    }
    
    //generate answer
    func generateAnswer() -> Int {
        let answer = firstFactor * secondFactor
        return answer
    }
    
    // check user guess --> return response and score
    func checkQuestion(guess: Int) -> String {
        if (guess != generateAnswer()){
            count = count - 1
            return "Not quite. 🤔 Looks like you need to brush up on your math. Try again."
        } else {
            count = count + 1
            return "That's correct! You are a bonafide genius! 🤓"
        }
    }
}

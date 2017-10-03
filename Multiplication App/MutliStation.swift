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
    
    
    // generate random factor
    func getFactor() -> Int {
        let factor = Int(arc4random_uniform(10)) + 1
        return factor
    }
    
    
    // generate question factors
    func generateQuestion(){
        firstFactor = getFactor()
        secondFactor = getFactor()
    }
    
    
    // check user guess --> return response and score
    func checkQuestion(guess: Int) -> String {
        if (guess != (firstFactor * secondFactor)){
            count = count - 1
            return "Not quite. 🤔 Looks like you need to brush up on your math. Try again."
        } else {
            count = count + 1
            return "That's correct! You are a bonafide genius! 🤓"
        }
    }
}

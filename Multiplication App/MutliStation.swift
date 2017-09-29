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
    
    
    // check user guess
    func checkQuestion(guess: Int) -> String {
        if (guess != (firstFactor * secondFactor)){
            return "Not quite... Looks like you need to brush up on your math facts. Try again."
        } else {
            return "That's correct! You are a bonafide genius!"
        }
    }
}

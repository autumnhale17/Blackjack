//
//  EndgameViews.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/8/26.
//

import SwiftUI

struct EndgameViews {
    
    func checkEndgameResult ( for gameCondition: Int) -> String {
        
        // If the game condition is 2, show the player win's view
        if (gameCondition == 2) {
            let _ = print("Player Wins!!!")
            return "Winner winner!"
        }
        
        // If the game condition is 3, show the player's lose view
        if gameCondition == 3 {
            //let _ = print("Player Loses.")
            
            return "Busted!"
        }
        
        return "End of Game"
    }
    
}

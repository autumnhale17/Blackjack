//
//  EndgameViews.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/8/26.
//

import SwiftUI

struct EndgameViews {
    
    func checkEndgameResult (gameCondition: Int) {
        
        // If the game condition is 2, show the player win's view
        if (gameCondition == 2) {
            struct playerWinView: View {
                
                var body: some View {
                    let _ = print("Player Wins!!!")
                }
                
            }
        }
        
        // If the game condition is 3, show the player's lose view
        struct playerLoseView: View {
            
            var body: some View {
                let _ = print("Player Loses!!! Sorry...")
            }
            
        }
    }
    
}

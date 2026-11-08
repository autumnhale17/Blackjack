//
//  Gameplay.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/8/26.
//

import SwiftUI

struct GameplayLogic {
    
    // Variable to hold whether the player has two Aces
    @State private var playerHasTwoAces = false
    
    // Function to compare two cards
    func compareTwoCards(firstCard: Card, secondCard: Card) {
        if firstCard > secondCard {
            print("\(firstCard) is higher than \(secondCard)")
        } else if firstCard < secondCard {
            print("\(firstCard) is lower than \(secondCard)")
        } else {
            print("\(firstCard) is the same value as \(secondCard)")
        }
    }
    
    
    // Overloaded calculate functions to account for passing in changed Ace values
    func calculatePlayerScore(firstCardValue: Card, secondCardValue: Card) -> Int {
        return firstCardValue.rank.rankValue + secondCardValue.rank.rankValue
    }
    
    func calculatePlayerScore(firstCardValue: Int, secondCardValue: Card) -> NSInteger {
        return firstCardValue + secondCardValue.rank.rankValue
    }
    
    func calculatePlayerScore(firstCardValue: Card, secondCardValue: Int) -> NSInteger {
        return firstCardValue.rank.rankValue + secondCardValue
    }
    
    func calculateDealerScore(firstCardValue: Card, secondCardValue: Card) -> Int {
        return firstCardValue.rank.rankValue + secondCardValue.rank.rankValue
    }
    
    func stand(playerFirstCard: Card, playerSecondCard: Card, dealerFirstCard: Card, dealerSecondCard: Card) -> Int {
        let dealerFirstValue = dealerFirstCard.rank.rankValue
        let dealerSecondValue = dealerSecondCard.rank.rankValue
        let playerScore = playerFirstCard.rank.rankValue + playerSecondCard.rank.rankValue
        let playerFirstValue = playerFirstCard.rank.rankValue
        let playerSecondValue = playerSecondCard.rank.rankValue
        
        // If either of a player's cards are an Ace...
        if (playerFirstValue == 1 || playerSecondValue == 1) {
            // If both of the player's cards are Aces, flip the flag for it and get out of this loop to not count a bust
            if (playerFirstValue + playerSecondValue == 2) {
                playerHasTwoAces = true
            }
            
            // If the player has a Blackjack, player wins (may need adjusted later based on game rules?)
            if (playerFirstValue == 10 || playerSecondValue == 10) {
                return 2
            }
            
        }
        
        // If either of the dealer's cards are not an Ace
        if (dealerFirstValue != 1 || dealerSecondValue != 1) {
            // If adding the dealer's card values together are less than the player's score, player wins
            if (dealerFirstValue + dealerSecondValue < playerScore) {
                print("Player wins with higher score.")
                return 2
            }
            
            // If adding the dealer's card values together are greater than or equal to 17 and higher than player's score, player loses
            if (dealerFirstValue + dealerSecondValue >= 17 && dealerFirstValue + dealerSecondValue > playerScore) {
                return 3
            }
            
            
            
            
        }
        // If either of the dealer's cards are an Ace
        //else if () {
            
        //}
        return 0;
    }
    
    
    
    
    
}

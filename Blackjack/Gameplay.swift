//
//  Gameplay.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/8/26.
//

import SwiftUI

struct GameplayLogic {
    
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
    
    func calculatePlayerScore(firstCardValue: Card, secondCardValue: Card) -> Int {
        return firstCardValue.rank.rankValue + secondCardValue.rank.rankValue
    }
    
    func calculateDealerScore(firstCardValue: Card, secondCardValue: Card) -> Int {
        return firstCardValue.rank.rankValue + secondCardValue.rank.rankValue
    }
    
    
    
    
    
    
}

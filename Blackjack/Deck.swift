//
//  Deck.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import SwiftUI

// Initializing the deck
struct Deck {
    
    struct Rank {
        let name: String
        let rankValue: Int
    }
    
    enum Suit: String {
        case clubs = "Clubs"
        case diamonds = "Diamonds"
        case hearts = "Hearts"
        case spades = "Spades"
    }
    
    // Creating arrays to hold suit and ranks
    private var allSuits:[Suit] = [.clubs, .diamonds, .hearts, .spades]
    
    private var allRanks = [
        Rank(name: "Ace", rankValue: 1),
        Rank(name: "Two", rankValue: 2),
        Rank(name: "Three", rankValue: 3),
        Rank(name: "Four", rankValue: 4),
        Rank(name: "Five", rankValue: 5),
        Rank(name: "Six", rankValue: 6),
        Rank(name: "Seven", rankValue: 7),
        Rank(name: "Eight", rankValue: 8),
        Rank(name: "Nine", rankValue: 9),
        Rank(name: "Ten", rankValue: 10),
        Rank(name: "Jack", rankValue: 10),
        Rank(name: "Queen", rankValue: 10),
        Rank(name: "King", rankValue: 10),
    ]
    
    // Defining cards as an array with the type Card that can be used to assign suit, rank, etc. to these cards
    var cards = [Card]()
    
    // Defining all cards available as an array of many Card
    private var availableCards: [Card]
    
    // "Create" the cards themselves by assigning each one a suit and rank
    init() {
        for suit in allSuits {
            for rank in allRanks{
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        // Adds all of the cards to the available card variable to be used
        self.availableCards = cards
    }
    
    // Shuffles from the available cards in the deck of cards
    mutating public func shuffle() {
        self.availableCards = self.cards.shuffled()
    }
    
    // Takes the card off of the top of the available cards in the deck and returns
    mutating func drawCard() -> Card? {
        if let card = self.availableCards.first {
            self.availableCards.removeFirst()
            return card
        } else {
            return nil
        }
    }
    
    // Top is assigned based on the first of the available cards in the deck
    var top: Card? {
        get {
            return availableCards.first
        }
    }
    
    // Get the count of how many cards are left in the deck after drawing
    var remaining: Int {
        get {
            return availableCards.count
        }
    }
    
}

// Create a card struct so that we can compare two cards together as well as tie the name of a card to pull an image
struct Card: Comparable, CustomDebugStringConvertible {
    
    let suit: Deck.Suit
    let rank: Deck.Rank
    
    var cardFileName: String {
        get {
            let cardName = "\(suit.rawValue) \(rank.name)"
            return cardName
        }
    }
    
    // Definition to tie the created name with the image name of a card
    var image: UIImage {
        get {
            let imageName = "\(suit.rawValue) \(rank.name)"
            return UIImage(named: imageName) ?? UIImage()
        }
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rankValue == rhs.rank.rankValue && lhs.suit == rhs.suit
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rankValue < rhs.rank.rankValue
    }
    
    var debugDescription: String {
        return "\(self.rank.name) of \(self.suit.rawValue)"
    }
    
    
}

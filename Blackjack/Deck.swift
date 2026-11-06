//
//  Deck.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import UIKit

// Defining the deck of cards with suites and ranks with respective info
struct Deck {
    enum Suite: String {
        case clubs = "Clubs"
        case diamonds = "Diamonds"
        case hearts = "Hearts"
        case spades = "Spades"

    }

    struct Rank {
        let name: String
        let rankValue: Int
    }
    
    // Creating an array to hold suites and ranks
    private var allSuites: [Suite] = [.clubs, .diamonds, .hearts, .spades]
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

    // Creating arrays for the deck and available cards in deck
    private let cards: [Card]
    private var availableCards: [Card]
    
    // Initializing
    init() {
        var cards = [Card]()
        for suite in allSuites {
            for rank in allRanks {
                cards.append(Card(suite: suite, rank: rank))
            }
        }
        self.cards = cards
        self.availableCards = cards
    }

    //  Function to define what it means to shuffle deck of cards
    mutating public func shuffle() {
        self.availableCards = self.cards.shuffled()
    }

    mutating public func drawCard() -> Card? {
        if let card = self.availableCards.first {
            self.availableCards.removeFirst()
            return card
        } else {
            return nil
        }
    }

    var top: Card? {
        return availableCards.first
    }

    var remaining: Int {
        return availableCards.count
    }
}

struct Card: Comparable, CustomDebugStringConvertible {
    let suite: Deck.Suite
    let rank: Deck.Rank

    var image: UIImage {
        let imageName = "\(rank.name)\(suite.rawValue)"
        return UIImage(named: imageName) ?? UIImage()
    }

    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rankValue == rhs.rank.rankValue
            && lhs.suite == rhs.suite
    }

    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rankValue < rhs.rank.rankValue
    }

    var debugDescription: String {
        return "\(self.rank.name) of \(self.suite.rawValue)"
    }
}

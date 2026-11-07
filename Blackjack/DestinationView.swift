//
//  DestinationView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import SwiftUI


struct DestinationView: View {
    let deck = Deck()
    
    var body: some View {
        ZStack{
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    ScrollView {
                        var deck = Deck()
                        let _ = print(deck.top ?? "Empty")
                        let _ = deck.shuffle()
                        let _ = print(deck.top ?? "Empty")
                        let topCard = deck.drawCard()
                        CardView(card: topCard!)
                        let _ = print("Showed a card!")
                        
                    }
                }
            }
        }
    }
}

struct CardView: View {
    var card: Card
    
    var body: some View {
        Image(uiImage: card.image)
            .resizable()
            .scaledToFit()
            
    }
    
    
}


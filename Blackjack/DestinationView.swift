//
//  DestinationView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import SwiftUI


struct DestinationView: View {
    
    var body: some View {
        
        let gameplayLogic = GameplayLogic()
        var deck = Deck()
        
        ZStack{
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                    HStack {
                        let _ = deck.shuffle()
                        let dealerFirstCard = deck.drawCard()
                        CardView(cardImgName: dealerFirstCard!)
                        //                        let _ = print("Showed one card!")
                        //                        let _ = print(topCard?.cardFileName)
                        //                        let _ = print(topCard?.image)
                        //                        let _ = print(topCard?.rank)
                        //                        let _ = print(topCard?.suit)
                        
                        let _ = deck.shuffle()
                        let dealerSecondCard = deck.drawCard()
                        FaceDownCardView()
                        //                        let _ = print("Showed another card!")
                        //                        let _ = print(topCard?.cardFileName)
                        //                        let _ = print(topCard?.image)
                        //                        let _ = print(topCard?.rank)
                        //                        let _ = print(topCard?.suit)
                        
                        // Coming back later for this... next coding sesh :)
                        //                    let _ = if firstCard > secondCard {
                        //                        let _ = print("\(firstCard) is higher than \(secondCard)")
                        //                    } let _ = else {
                        //                        let _ = print("Hmm not sure...")
                        //                    }
                        
                        let _ = print("Dealer card comparison: ")
                        let _ = gameplayLogic.compareTwoCards(firstCard: dealerFirstCard!, secondCard: dealerSecondCard!)
                        
                        Text("Here's a card or two!")
                    }
                
                HStack {
                    
                    let _ = deck.shuffle()
                    let firstCard = deck.drawCard()
                    CardView(cardImgName: firstCard!)
                    //                        let _ = print("Showed one card!")
                    //                        let _ = print(topCard?.cardFileName)
                    //                        let _ = print(topCard?.image)
                    //                        let _ = print(topCard?.rank)
                    //                        let _ = print(topCard?.suit)
                    
                    let _ = deck.shuffle()
                    let secondCard = deck.drawCard()
                    CardView(cardImgName: secondCard!)
                    //                        let _ = print("Showed another card!")
                    //                        let _ = print(topCard?.cardFileName)
                    //                        let _ = print(topCard?.image)
                    //                        let _ = print(topCard?.rank)
                    //                        let _ = print(topCard?.suit)
                    
                    // Coming back later for this... next coding sesh :)
                    //                    let _ = if firstCard > secondCard {
                    //                        let _ = print("\(firstCard) is higher than \(secondCard)")
                    //                    } let _ = else {
                    //                        let _ = print("Hmm not sure...")
                    //                    }
                    
                    let _ = print("Player card comparison: ")
                    let _ = gameplayLogic.compareTwoCards(firstCard: firstCard!, secondCard: secondCard!)
                    
                    Text("Here's a card or two!")
                }
            }
        }
    }
        
        struct CardView: View {
            var cardImgName: Card
            
            var body: some View {
                Image(uiImage: cardImgName.image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                //let _ = print("Made it to CardView!")
            }
            
        }
    
    struct FaceDownCardView: View {
        
        var body: some View {
            Image(uiImage: .redBack)
                .resizable()
                .scaledToFit()
                .padding()
            
            //let _ = print("Made it to FaceDownCardView!")
        }
        
    }
}


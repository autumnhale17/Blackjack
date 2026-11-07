//
//  DestinationView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import SwiftUI


struct DestinationView: View {
    
    
    //let topCard: UIImage?
    
    var body: some View {
        
        
        ZStack{
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            VStack {
                var deck = Deck()
                
                Spacer()
                HStack {
                    Spacer()
                    let _ = deck.shuffle()
                    let firstCard = deck.drawCard()
                    CardView(cardImgName: firstCard!)
                    //                        let _ = print("Showed one card!")
                    //                        let _ = print(topCard?.cardFileName)
                    //                        let _ = print(topCard?.image)
                    //                        let _ = print(topCard?.rank)
                    //                        let _ = print(topCard?.suit)
                    
                    Spacer()
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
    }


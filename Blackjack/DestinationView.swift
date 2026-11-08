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
                
                Text("Dealer")
                    .font(
                        .system(
                            size: 20,
                            weight: .bold,
                            design: .monospaced
                        )
                    )
                
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
                        
                    }
                
                    .padding()
                    .border(.gold, width: 4)
                    .padding()
                    
                    
                
                Spacer()
                
                HStack {
                    
                    let _ = deck.shuffle()
                    let playerFirstCard = deck.drawCard()
                    
                    ZStack(alignment: .trailing) {
                        ZStack{
                            CardView(cardImgName: playerFirstCard!)
                            // let _ = print("Showed one card!")
                            // let _ = print(topCard?.cardFileName)
                            // let _ = print(topCard?.image)
                            // let _ = print(topCard?.rank)
                            // let _ = print(topCard?.suit)
                            
                        }
                        .offset(x: 40)
                            
                            let _ = deck.shuffle()
                            let playerSecondCard = deck.drawCard()
                            
                            
                            CardView(cardImgName: playerSecondCard!)
                            // let _ = print("Showed another card!")
                            // let _ = print(topCard?.cardFileName)
                            // let _ = print(topCard?.image)
                            // let _ = print(topCard?.rank)
                            // let _ = print(topCard?.suit)
                            
                            
                            let _ = print("Player card comparison: ")
                            let _ = gameplayLogic.compareTwoCards(firstCard: playerFirstCard!, secondCard: playerSecondCard!)
                        
                        
                        
                        Text()
                        
                    }
                    
                    .padding(.trailing, 25)
                }
                Spacer()
                
                
                
                // Buttons for user to play the game
                HStack {
                    Spacer()
                    Button(action: {
                        // print("Hit Button Pressed")
                        
                    }) {
                        Text("Hit")
                            .font(
                                .system(
                                    size: 20,
                                    weight: .bold,
                                    design: .monospaced
                                )
                            )
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        // print("Stand Button Pressed")
                        
                    }) {
                        Text("Stand")
                            .font(
                                .system(
                                    size: 20,
                                    weight: .bold,
                                    design: .monospaced
                                )
                            )
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        // print("Double Down Button Pressed")
                        
                    }) {
                        Text("Double Down")
                            .font(
                                .system(
                                    size: 20,
                                    weight: .bold,
                                    design: .monospaced
                                )
                            )
                    }
                    
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gold)
                    .cornerRadius(10)
                    .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    Spacer()
                }
                
            }
        }
    }
        
    // Allows us to see the card itself by taking in a card and pulling the respective uiImage
        struct CardView: View {
            var cardImgName: Card
            
            var body: some View {
                Image(uiImage: cardImgName.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 280)
                
                //let _ = print("Made it to CardView!")
            }
            
        }
    
    // Allows us to visually see a face down card
    struct FaceDownCardView: View {
        
        var body: some View {
            Image(uiImage: .redBack)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 280)
            
            
            //let _ = print("Made it to FaceDownCardView!")
        }
        
    }
}


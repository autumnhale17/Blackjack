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
                
                // Shuffle and draw the dealer's two cards. Only show one at first.
                let _ = deck.shuffle()
                let dealerFirstCard = deck.drawCard()
                let dealerSecondCard = deck.drawCard()
                
                
                // Shows the dealer's current known score
                Text("Dealer Score: " + String((dealerFirstCard?.rank.rankValue)!))
                    .font(
                        .system(
                            size: 20,
                            weight: .bold,
                            design: .monospaced
                        )
                    )
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.gold, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(40)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.orange, lineWidth: 3)
                    )
                    .padding(.top, 30)
                    .padding(.bottom, -20)
                
                // Display one of the cards at first alongside a face down card
                    HStack {
                        CardView(cardImgName: dealerFirstCard!)
//                        let _ = print("Showed one card!")
//                        let _ = print(topCard?.cardFileName)
//                        let _ = print(topCard?.image)
//                        let _ = print(topCard?.rank)
//                        let _ = print(topCard?.suit)
                        
                        FaceDownCardView()
//                        let _ = print("Showed another card!")
//                        let _ = print(topCard?.cardFileName)
//                        let _ = print(topCard?.image)
//                        let _ = print(topCard?.rank)
//                        let _ = print(topCard?.suit)
                        
//                        let _ = print("Dealer card comparison: ")
//                        let _ = gameplayLogic.compareTwoCards(firstCard: dealerFirstCard!, secondCard: dealerSecondCard!)
                        
                    }
                    //.border(.gold, width: 4)
                    
                
                // Shuffle and draw two cards
                let _ = deck.shuffle()
                let playerFirstCard = deck.drawCard()
                let playerSecondCard = deck.drawCard()
                
                HStack {
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
                            
                            CardView(cardImgName: playerSecondCard!)
                            // let _ = print("Showed another card!")
                            // let _ = print(topCard?.cardFileName)
                            // let _ = print(topCard?.image)
                            // let _ = print(topCard?.rank)
                            // let _ = print(topCard?.suit)
                            
                            
                            let _ = print("Player card comparison: ")
                            let _ = gameplayLogic.compareTwoCards(firstCard: playerFirstCard!, secondCard: playerSecondCard!)
                        
                    }
                    
                    .padding(.trailing, 25)
                    
                }
                .padding(.bottom, -40)
                
                // Shows the player's current score
                let currentPlayerScore = gameplayLogic.calculatePlayerScore(firstCardValue: playerFirstCard!, secondCardValue: playerSecondCard!)
                Text("Player Score: " + String(currentPlayerScore))
                    .font(
                        .system(
                            size: 20,
                            weight: .bold,
                            design: .monospaced
                        )
                    )
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.gold, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(40)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.orange, lineWidth: 3)
                    )
                
                    .padding()
                
                
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
                Spacer()
                Spacer()
                
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


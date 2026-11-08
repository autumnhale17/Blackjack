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
        let endgameView = EndgameViews()
        
        ZStack{
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                // Shuffle and draw the dealer's two cards. Only show one at first.
                let _ = deck.shuffle()
                let dealerFirstCard = deck.drawCard()
                let _ = deck.shuffle()
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
                    
                    let _ = print("Dealer card comparison: ")
                    let _ = gameplayLogic.compareTwoCards(firstCard: dealerFirstCard!, secondCard: dealerSecondCard!)
                    let _ = print("Dealer score: ")
                    let _ = print(String(gameplayLogic.calculateDealerScore(firstCardValue: dealerFirstCard!, secondCardValue: dealerSecondCard!)))
                    
                }
                //.border(.gold, width: 4)
                
                
                // Shuffle and draw two cards
                let _ = deck.shuffle()
                let playerFirstCard = deck.drawCard()
                let _ = deck.shuffle()
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
                        
                        
                        //let _ = print("Player card comparison: ")
                        //let _ = gameplayLogic.compareTwoCards(firstCard: playerFirstCard!, secondCard: playerSecondCard!)
                        
                    }
                    
                    .padding(.trailing, 25)
                    
                }
                .padding(.bottom, -40)
                
                // Shows the player's current score
                
                // If either of the player's cards is an Ace, we want to show both possible scores they can use
                if (playerFirstCard?.rank.rankValue == 1 || playerSecondCard?.rank.rankValue == 1) {
                    // If the player has two Aces, we will show a 2 to avoid bust
                    if (playerFirstCard?.rank.rankValue == 1 && playerSecondCard?.rank.rankValue == 1) {
                        ShowPlayerScore(currentPlayerScore: 2)
                    }
                    
                    // Calculate the score with an Ace as a 1
                    let currentPlayerScore = gameplayLogic.calculatePlayerScore(firstCardValue: playerFirstCard!, secondCardValue: playerSecondCard!)
                    
                    // If the first card is an Ace, calculate it as an 11
                    if (playerFirstCard?.rank.rankValue == 1) {
                        let currentPlayerScoreWithAce = gameplayLogic.calculatePlayerScore(firstCardValue: 11, secondCardValue: playerSecondCard!)
                        ShowPlayerScore(currentPlayerScore: currentPlayerScore)
                        //currentPlayerScoreWithAce
                        
                    }
                    // Second card is an Ace, calculate accordingly
                    else {
                        let currentPlayerScoreWithAce = gameplayLogic.calculatePlayerScore(firstCardValue: playerFirstCard!, secondCardValue: 11)
                        //ShowPlayerScore(currentPlayerScore: currentPlayerScore + "/" + currentPlayerScoreWithAce)
                    }
                    
                }
                
                let currentPlayerScore = gameplayLogic.calculatePlayerScore(firstCardValue: playerFirstCard!, secondCardValue: playerSecondCard!)
                
                
                
                // Buttons for user to play the game
                HStack {
                    Spacer()
                    Button("Stand", action: {
                        let _ = print("Stand Button Pressed")
                        
                        let playerStands = gameplayLogic.stand(playerFirstCard: playerFirstCard!, playerSecondCard: playerSecondCard!, dealerFirstCard: dealerFirstCard!, dealerSecondCard: dealerSecondCard!)
                        
                        endgameView.checkEndgameResult(gameCondition: playerStands)
                    })
                            .font(
                                .system(
                                    size: 20,
                                    weight: .bold,
                                    design: .monospaced
                                )
                            )
                    
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    Spacer()
                    
                    
                    Button( action: {
                        // print("Stand Button Pressed")
                        
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
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
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
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
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
    
    struct ShowPlayerScore: View {
        
    let currentPlayerScore: Int
        
        var body: some View {
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
        }
        
    }
}


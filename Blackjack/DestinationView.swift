//
//  DestinationView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import SwiftUI


struct DestinationView: View {
    
    // Creating instance of a deck to be used
    @State var deck = Deck()
    
    let gameplayLogic = GameplayLogic()
    let endgameView = EndgameViews()
    
    @State var dealerFirstCard: Card?
    @State var dealerSecondCard: Card?
    
    // Holds the cards that the dealer has in an array
    @State var dealerHandCards: [Card] = []
    
    // Holds the cards the player has in an array
    @State var playerCards: [Card] = []
    
    // Flag for if the dealer's second card is shown
    @State var isDealerSecondCardRevealed = false
    
    var body: some View {
        
        ZStack{
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                HStack {
                    
                    // Show dealer's first card
                    if let dealerFirstCard {
                        CardView(cardImgName: dealerFirstCard)
                    }
                    
                    // Show dealer's second card if flag is on, else show the "backside"
                    if isDealerSecondCardRevealed, let dealerSecondCard {
                        CardView(cardImgName: dealerSecondCard)
                    } else {
                        Image("BackRed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 280)
                    }
                    
                    // Show the entire dealer's hand thereafter
                    ForEach(dealerHandCards.indices, id: \.self) { index in
                        CardView(cardImgName: dealerHandCards[index])
                    }
                }
                
                // Shows the dealer's current known score
//                Text("Dealer Score: " + String((12)!))
//                    .font(
//                        .system(
//                            size: 20,
//                            weight: .bold,
//                            design: .monospaced
//                        )
//                    )
//                    .padding()
//                    .background(
//                        LinearGradient(
//                            colors: [.gold, .orange],
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing
//                        )
//                    )
//                    .cornerRadius(40)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 40)
//                            .stroke(.orange, lineWidth: 3)
//                    )
//                    .padding(.top, 30)
//                    .padding(.bottom, -20)
                
                // Show every card in player's hand
                HStack {
                    ZStack(alignment: .trailing) {
                        ZStack{
                            ForEach(playerCards.indices, id: \.self) { index in
                                CardView(cardImgName: playerCards[index])
                            }
                            .offset(x: 40)
                        }
                        //.padding(.trailing, 25)
                    }
                    
                    
                }
                // Calculate the player's score and show
                PlayerScoreView(cards: playerCards)
                
                // Buttons for user to play the game
                HStack {
                    Spacer()
                    Button("Stand", action: {
                        let _ = print("Stand Button Pressed")
                        
                        
                        
                        //let playerStands = gameplayLogic.stand(playerFirstCard: playerFirstCard!, playerSecondCard: playerSecondCard!, dealerFirstCard: dealerFirstCard!, dealerSecondCard: dealerSecondCard!)
                        
                        //endgameView.checkEndgameResult(gameCondition: playerStands)
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
        // Only deal when this view first appears
        .onAppear {
            // If the dealer has been dealt at least on card, we won't redeal
            guard dealerFirstCard == nil else { return }
            
            // If the player has been dealt at least one card, we don't redeal
            guard playerCards.isEmpty else { return }
            
            // Shuffle then draw two dealer cards and player cards to begin
            deck.shuffle()
            dealerFirstCard = deck.drawCard()
            dealerSecondCard = deck.drawCard()
            
            playerCards.append(deck.drawCard()!)
            playerCards.append(deck.drawCard()!)
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

    struct PlayerScoreView: View {
        
        let cards: [Card]

        // Calculating Ace as 1's
         var lowScore: Int {
            var score = 0

            for card in cards {
                score = score + card.rank.rankValue
            }
            
            return score
        }

        // If the hand has an Ace, we do further calculations
         var hasAce: Bool {
            var foundAce = false

            for card in cards {
                if card.rank.rankValue == 1 {
                    foundAce = true
                }
            }
            
            return foundAce
        }

        // If player as an Ace and has not busted, show both their scores
        var body: some View {
            if hasAce && lowScore + 10 <= 21 {
                ShowPlayerScoreWithAce(
                    currentPlayerScore: lowScore,
                    currentPlayerAceScore: lowScore + 10
                )
            }
            // If no Aces, just show the one score
            else {
                ShowPlayerScore(currentPlayerScore: lowScore)
            }
            
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.orange, lineWidth: 3)
                    )
                
                    .padding()
            }
            
        }
    
    struct ShowPlayerScoreWithAce: View {
        
        let currentPlayerScore: Int
        let currentPlayerAceScore: Int
        
        var body: some View {
            Text("Player Score: " + String(currentPlayerScore) + "/" + String(currentPlayerAceScore))
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
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.orange, lineWidth: 3)
                )
            
                .padding()
        }
        
    }

#Preview {
    DestinationView()
}

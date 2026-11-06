//
//  DestinationView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/5/26.
//

import SwiftUI

var deck = Deck()

struct DestinationView: View {
    var body: some View {
        ZStack{
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            Text("This is the Another View")
                .navigationTitle("Another View")
        }
        .onAppear(perform: {print(deck.top ?? "Empty")})
    }
        
    
    
}

#Preview {
    DestinationView()
}

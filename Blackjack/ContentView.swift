//
//  ContentView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gameBoard
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(._7Diamond)
                    .resizable()
                    .frame(width: 100, height: 150, alignment: .bottom)
                    .padding()
                
                Text("Blackjack").padding()
                
                    
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

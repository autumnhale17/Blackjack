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

            // Holds the landing page image, title, and button
            VStack {
                Spacer()
                Text("Blackjack").padding()
                    .font(.system(size: 60, weight: .bold, design: .monospaced))
                HStack {
                    Spacer()
                    Image(._7Diamond)
                        .resizable()
                        .frame(width: 150, height: 200, alignment: .bottom)
                        .padding()
                    Spacer()
                    Image(.redBack)
                        .resizable()
                        .frame(width: 150, height: 200, alignment: .bottom)
                        .padding()
                }

                Spacer()
                Button(action: {
                    print("Button Pressed")
                }) {
                    Text("Play")
                        .font(
                            .system(
                                size: 30,
                                weight: .bold,
                                design: .monospaced
                            )
                        )
                }
                .buttonStyleModifier()

            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

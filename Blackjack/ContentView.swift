//
//  ContentView.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/4/26.
//

import SwiftUI

struct ContentView: View {

    // Variable to hold whether the gameplay page can be showed or not
    @State private var isShowingGamearea = false

    var body: some View {

        NavigationView {
            ZStack {
                Color.gameBoard
                    .edgesIgnoringSafeArea(.all)

                // Holds the landing page image, title, and button
                VStack {
                    Spacer()
                    Text("Blackjack").padding()
                        .font(
                            .system(
                                size: 60,
                                weight: .bold,
                                design: .monospaced
                            )
                        )
                    
                    // Card images
                    HStack {
                        Spacer()
                        Image(.diamondsSeven)
                            .resizable()
                            .frame(width: 150, height: 200, alignment: .bottom)
                            .padding()
                        Spacer()
                        Image(.redBack)
                            .resizable()
                            .frame(width: 150, height: 200, alignment: .bottom)
                            .padding()
                    }

                    // Button to navigate to gameplay view
                    Spacer()
                    NavigationLink(
                        destination: DestinationView().navigationBarBackButtonHidden(true),
                        isActive: $isShowingGamearea
                    ) { }

                    Button(action: {
                        // print("Play Button Pressed")
                        isShowingGamearea = true
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
            }
        }
    }
}

#Preview {
    ContentView()
}

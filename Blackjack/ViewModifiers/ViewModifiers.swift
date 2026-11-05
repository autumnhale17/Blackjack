//
//  ViewModifiers.swift
//  Blackjack
//
//  Created by Autumn Hale on 11/4/26.
//

import SwiftUI


// Modifier for custom button
struct ButtonStyleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(Color.white)
            .background(Color.blue)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}
    
extension View {
    func buttonStyleModifier() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

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
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 5)
        
        
    }
}
    
extension View {
    func buttonStyleModifier() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

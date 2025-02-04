//
//  AnimationView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 29/04/24.
//

import SwiftUI

struct AnimationView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2-animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false), value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        
    }
}

#Preview {
    AnimationView()
}

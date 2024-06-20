//
//  SwiftUIView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 19/09/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    
    let workoutDateRange = Date()...Date().addingTimeInterval(60)
    
    @State private var value = 0
    let step = 5
    let range = 0...50
    
    var body: some View {
        VStack {
            Spacer()
            Text("Current stepper value: \(value)")
            Stepper(value: $value, in: range, step: step) {
                Text("Current: \(value) in \(range.description) " + "stepping by \(step)")
            }
            .padding(10)
            
            Spacer()
            ProgressView()
            Spacer()
            
            
            
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            ).padding(.horizontal)
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
            Spacer()
            ProgressView(timerInterval: workoutDateRange) {
                Text("Timer")
            }.padding(.horizontal)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

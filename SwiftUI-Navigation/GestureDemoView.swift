//
//  GestureDemoView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 04/09/23.
//

import SwiftUI

struct GestureDemoView: View {
    @State private var dragOffset = CGSize.zero
    @State private var colorForLongPress = Color.yellow
    @State private var colorForDoubleTap = Color.yellow
    private var colors: [Color] = [.yellow, .blue, .cyan, .green, .indigo, .orange, .mint, .pink, .purple, .brown]
    
    var body: some View {
        VStack {
            // Masked image with text
            Image("diwali-fireworks")
                .resizable()
                .frame(width: 300, height: 300)
                .mask(
                    Text("SWIFT!")
                        .font(.system(size: 72,weight: .bold))
                )
                .shadow(color: (.red), radius: 5)
                
            Circle()
                .offset(dragOffset)
                .fill(.cyan)
                .frame(width: 50)
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            dragOffset = gesture.translation
                        })
                        .onEnded({gesture in
                            dragOffset = .zero
                        })
                )
            Circle()
                .fill(colorForLongPress)
                .frame(width:150)
                .gesture(
                    LongPressGesture()
                        .onEnded({ _ in
                            withAnimation {
                                colorForLongPress = colors.randomElement()!
                            }
                        }))
            Capsule()
                .frame(width: 100, height: 40, alignment: .center)
                .foregroundStyle(.cyan)
            Text("Hover here")
                .foregroundColor(.cyan)
                
            HStack {
                Circle()
                    .fill(colorForDoubleTap)
                    .border(.brown)
    //                    .stroke(.red, lineWidth: 5)
    //                    .stroke(.black, lineWidth: 15)
    //                    .stroke(.yellow, lineWidth: 25)
    //                    .stroke(.green, lineWidth: 35)
    //                    .stroke(.blue, lineWidth: 45)
    //                    .stroke(.indigo, lineWidth: 55)
                    .frame(width: 150, height: 150)
                    .onTapGesture(count: 2, coordinateSpace: .global) { location in
                        print("Tapped at \(location)")
                        colorForDoubleTap = colors.map({color in
                            if color != colorForDoubleTap {
                            return color
                        } else{
                            return .black}
                        }).randomElement()!
                    }
                
            }
            .frame(width: 300)
            .background(.blue)
            .simultaneousGesture(
                TapGesture(count: 2).onEnded{ location in
                    print("VStack tapped \(location)")
                })
            
//            New in iOS 17
//            Circle()
//                .union(.capsule.inset(by: 100))
//                .fill(.blue)
            
//            Circle()
//                .lineSubtraction(.rect.inset(by: 30))
//                .stroke(style: .init(lineWidth: 20, lineCap: .round))
//                .padding()
            
//            Circle()
//                .offset(x: -100)
//                .symmetricDifference(.circle.offset(x: 100))
//                .fill(.red)
//                .padding()
        }
    }
}

struct GestureDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GestureDemoView()
    }
}

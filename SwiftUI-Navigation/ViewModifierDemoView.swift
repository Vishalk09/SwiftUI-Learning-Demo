//
//  ViewModifierDemoView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 15/04/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        
        ZStack(alignment: .bottomTrailing) {
            content
            
                Text(text)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.black)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 10))
        }
    }
}

struct CapsuleView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        // More to add
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                            content(row,column)
                    }
                }
                
            }
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct ViewModeifierDemoView: View {
    let title1 = Text("First Title")
    let title2 = Text("Second Title")
//    var spells: some View {
//        Group {
//            Text("Grouping")
//            Text("Views")
//        }
//    }
    
    @ViewBuilder var spells: some View {
        Text("Grouping")
        Text("Views")
    }
    var body: some View {
        VStack {
            spells
            
            CapsuleView(text: "Button")
                .foregroundColor(.white)
                .padding(.top)
            
            Text("View")
                .modifier(Title())
                .padding(.top)
            
            GridStack(rows: 4, columns: 4) { row, col in
                VStack {
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row)C\(col)")
                        .monospaced()
                        
                }
                .background(.white)
                .padding(1)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }.padding(.top)
            
        }
        .frame(width: 310, height: 500)
        .background(.yellow)
        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 10,  bottomLeadingRadius: 10,
            topTrailingRadius: 10))
        .watermarked(with: "© VK")
        
        
    }
}

#Preview {
    ViewModeifierDemoView()
}

//
//  ScrollViewDemo.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 05/09/23.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
//        New in iOS 17
//        ScrollView(.horizontal) {
//            LazyHStack {
//                ForEach(0..<10) { i in
//                    RoundedRectangle(cornerRadius: 25)
//                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
//                        .frame(width: 300, height: 100)
//                }
//            }
//            .scrollTargetLayout()
//        }
//        .scrollTargetBehavior(.viewAligned)
//        .safeAreaPadding(.horizontal, 40)
        Text("Text")
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}

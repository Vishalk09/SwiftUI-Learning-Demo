//
//  SwiftUIView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 19/09/23.
//

import SwiftUI

struct AnimationDemoView: View {
    @State private var isTrailing = false
    @State private var scale = 0.5

    var body: some View {
       VStack(alignment: isTrailing ? .trailing : .leading) {
           Image(systemName: "box.truck")
                .font(.system(size: 64))


           Toggle("Move to trailing edge",
                   isOn: $isTrailing.animation(.linear))
           
           VStack {
               Circle()
                   .scaleEffect(scale)
                   .animation(.spring(), value: scale)
               HStack {
                   Button("+") { scale += 0.1 }
                   Button("-") { scale -= 0.1 }
               }
           }
       }
    }
}

struct AnimationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemoView()
    }
}

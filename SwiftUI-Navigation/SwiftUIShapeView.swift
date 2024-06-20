//
//  SwiftUIShapeView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 04/09/23.
//

import SwiftUI

struct SwiftUIShapeView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(width: 200, height: 200)
            
//            ios 17
//            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
//                .fill(.orange)
//                .frame(width: 200, height: 200)
//
            Capsule()
                .fill(.green)
                .frame(width: 100, height: 50)
            
            Ellipse()
                .fill(.blue)
                .frame(width: 100, height: 50)
            
            Circle()
                .fill(.yellow)
                .frame(width: 100, height: 50)
            
//            New in iOS 17
//            Circle()
//                .union(.capsule.inset(by: 100))
//                .fill(.blue)
//
//            Circle()
//                .lineSubtraction(.rect.inset(by: 30))
//                .stroke(style: .init(lineWidth: 20, lineCap: .round))
//                .padding()
//
//            Circle()
//                .offset(x: -100)
//                .symmetricDifference(.circle.offset(x: 100))
//                .fill(.red)
//                .padding()
        }
    }
}

struct SwiftUIShapeView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShapeView()
    }
}

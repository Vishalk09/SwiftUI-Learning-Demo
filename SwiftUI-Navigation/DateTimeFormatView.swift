//
//  DateTimeFormatView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 30/08/23.
//

import SwiftUI

struct DateTimeFormatView: View {
    var body: some View {
        VStack {
            Text(Date.now.addingTimeInterval(600), style: .date).modifier(DateText())
            Text(Date.now.addingTimeInterval(600), style: .time).modifier(DateText())
            Text(Date.now.addingTimeInterval(600), style: .offset).modifier(DateText())
            Text(Date.now.addingTimeInterval(600), style: .relative).modifier(DateText())
            Text(Date.now.addingTimeInterval(600), style: .timer).modifier(DateText())
        
        }
    }
}

struct DateTimeFormatView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeFormatView()
    }
}

struct DateText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .padding()
            .frame(width: 300)
            .background(.blue)
            .cornerRadius(20)
            .font(.system(size: 20, weight: .semibold, design: .serif))
            
    }
}

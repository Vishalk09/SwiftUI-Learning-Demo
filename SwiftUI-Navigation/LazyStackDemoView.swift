//
//  LazyStackDemoView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 05/09/23.
//

import SwiftUI


// When we use normal stack all content loaded at one time.
// In LazyVStack content loaded when we start scrolling.

struct LazyStackDemoView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self, content: SampleRow.init)
            }
        }
    }
}

struct LazyStackDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackDemoView()
    }
}

struct SampleRow: View {
    let id: Int

    var body: some View {
        Text("Row \(id)")
    }

    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

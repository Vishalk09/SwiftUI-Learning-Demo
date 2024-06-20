//
//  SwiftUITabView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 10/10/23.
//

import SwiftUI

struct SwiftUITabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContentView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            NavigationView {
                DateTimeFormatView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

struct SwiftUITabView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITabView()
    }
}

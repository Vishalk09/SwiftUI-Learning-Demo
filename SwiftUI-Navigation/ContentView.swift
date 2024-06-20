//
//  ContentView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 25/08/23.
//

import SwiftUI

/*
 
 - Used navigationstack and navigation links to show navigation from one view to another.
 - Used navigation path to show how view are stacked.
 - Divided views in section in list.
 
 */

struct ContentView: View {
    
    var platforms: [Platform] = [.init(name: "XBox", imageName: "xbox.logo", color: .green),
                                 .init(name: "Playstation", imageName: "playstation.logo", color: .indigo),
                                 .init(name: "PC", imageName: "pc", color: .pink),
                                 .init(name: "Mobile", imageName: "iphone", color: .mint)]
    var games: [Game] = [.init(name: "Minecraft", rating: "99"),
                         .init(name: "God of War", rating: "98"),
                         .init(name: "Fortnite", rating: "92"),
                         .init(name: "GTA", rating: "90")]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        /*
         // Normal navigation
         
         NavigationStack {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text("\(game.name)")
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle.bold())
                }
            }
            .navigationDestination(for: Game.self) { game in
                Text("\(game.name) - \(game.rating)")
                    .font(.largeTitle.bold())
            }
        }*/                                                      
        
        
        // Navigation view stacking
        NavigationStack(path: $path) {
            List() {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
                
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text("\(game.name)")
                        }
                    }
                }
                
                Section("Views") {
                    NavigationLink("Chart View") {
                        ChartView()
                    }
                    
                }
                
                Section("Other"){
                    NavigationLink("Date and time") {
                        DateTimeFormatView()
                    }
                    NavigationLink("Text Editor") {
                        TextFieldView()
                    }
                    NavigationLink("News") {
    //                    @State var newsData: [Article.Response]? = nil
    //                    NewsFeedView(newsData: [Article.Response()])
    //
                        NewsFeedViewUsingURL()
                    }
                    NavigationLink("Shapes"){
                        SwiftUIShapeView()
                    }
                    NavigationLink("Gestures"){
                        GestureDemoView()
                    }
                    
                    NavigationLink("View Modifier Demo") {
                        ViewModeifierDemoView()
                    }
                    
                    NavigationLink("Word Scramble") {
                        WordScramble()
                    }
                    
                    NavigationLink("Button Animation") {
                        AnimationView()
                    }
                }
                
            }
            .toolbar() {
                EditButton()
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    
                    VStack {
                        Label(platform.name, systemImage: platform.imageName)
                            .font(.largeTitle.bold())
                        
                        List {
                            ForEach(games, id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in

                VStack(spacing: 20) {
                    Text("\(game.name) - \(game.rating)")
                        .font(.largeTitle.bold())
                    Button("Recommended game") {
                        path.append(games.randomElement()!)
                    }
                    Button("Go to another platform") {
                        path.append(platforms.randomElement()!)
                    }
                    Button("Go home") {
                        path.removeLast(path.count)
                    }
                }
            }
            .refreshable {
                print("Refresh code")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        ContentView()
            .preferredColorScheme(.dark) // show dark theme
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

struct Platform: Hashable {
    var name: String
    var imageName: String
    var color: Color
}

struct Game: Hashable {
    var name: String
    var rating: String
}

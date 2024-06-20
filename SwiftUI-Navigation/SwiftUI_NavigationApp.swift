//
//  SwiftUI_NavigationApp.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 25/08/23.
//

import SwiftUI
import CoreData

@main
struct SwiftUI_NavigationApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
//    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}

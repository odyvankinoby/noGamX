//
//  noGamXApp.swift
//  noGamX
//
//  Created by Nicolas Ott on 23.11.21.
//

import SwiftUI

@main
struct noGamXApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

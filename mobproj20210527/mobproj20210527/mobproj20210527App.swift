//
//  mobproj20210527App.swift
//  mobproj20210527
//
//  Created by selfoulger on 5/27/21.
//

import SwiftUI

@main
struct mobproj20210527App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

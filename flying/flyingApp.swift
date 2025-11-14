//
//  flyingApp.swift
//  flying
//
//  Created by bill on 11/14/25.
//

import SwiftUI
import SwiftData

@main
struct flyingApp: App {
    var body: some Scene {
        WindowGroup {
            AircraftListView()
                .modelContainer(for: [Aircraft.self, Flight.self])
        }
    }
}

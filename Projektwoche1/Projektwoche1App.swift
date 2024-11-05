//
//  Projektwoche1App.swift
//  Projektwoche1
//
//  Created by Felix B on 03.11.24.
//

import SwiftUI

@main
struct Projektwoche1App: App {
    @Environment(\.modelContext) var context
    var body: some Scene {
        WindowGroup {
            BottomNav()
                .modelContainer(for: Student.self)
        }
       
    }
}

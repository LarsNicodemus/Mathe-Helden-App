//
//  Projektwoche1App.swift
//  Projektwoche1
//
//  Created by Felix B on 03.11.24.
//

import SwiftUI
import SwiftData

@main
struct Projektwoche1App: App {
    @Environment(\.modelContext) private var modelContext: ModelContext
    var body: some Scene {
        WindowGroup {
            BottomNav()
                .modelContainer(for: [Classroom.self, StoredQuizzes.self, Student.self, Points.self, LeaderBoard.self, ])
        }
       
    }
}

//
//  BottomNav.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftData
import SwiftUI

struct BottomNav: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    @Query var storedQuizzes: [StoredQuizzes]
    @State var loggedIn: Bool = false
    @State var student: Student?
    var body: some View {
        if loggedIn {

            TabView {

                Tab("Rechnen", systemImage: "plus.forwardslash.minus") {
                    RechenOverView(student: $student)

                }
                Tab("Leaderboard", systemImage: "medal") {
                    LeaderBoardView(student: $student)
                }
                Tab("Stundenplan", systemImage: "calendar") {
                    LessonPlanView()
                }
                Tab("Einstellungen", systemImage: "gearshape.2") {
                    SettingsView(loggedIn: $loggedIn, student: $student)
                }
            }

        } else {

            LoginScreenView(loggedIn: $loggedIn, student: $student)
        }

    }
}

#Preview {
    BottomNav()
        .modelContainer(
            for: [Classroom.self, StoredQuizzes.self], inMemory: true)
}

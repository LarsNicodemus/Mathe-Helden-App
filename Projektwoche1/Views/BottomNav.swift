//
//  BottomNav.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftData
import SwiftUI

struct BottomNav: View {
    @Environment(\.modelContext) var context
    let testStudent1 = Student(username: "Student1", password: "password123",name: "Test 1")
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @State var loggedIn: Bool = true
    var body: some View {
        if loggedIn {
            TabView {

                Tab("Rechnen", systemImage: "plus.forwardslash.minus") {
                    RechnenView()
                }
                Tab("Leaderboard", systemImage: "medal") {
                    LeaderBoardView()
                }
                Tab("Stundenplan", systemImage: "calendar") {

                }
                Tab("Einstellungen", systemImage: "gearshape.2") {
                    Button("Logout" ,action:{
                        loggedIn = false
                    })
                }
            }
            .onAppear {
                UITabBar.appearance().backgroundColor = .white
        }
        } else {
            LoginScreenView(loggedIn: $loggedIn)
        }
    }
    
}

#Preview {
    BottomNav()
        .modelContainer(for: Classroom.self, inMemory: true)
}

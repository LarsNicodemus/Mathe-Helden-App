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

                }
                Tab("Einstellungen", systemImage: "gearshape.2") {
                    Button(
                        "Logout",
                        action: {
                            loggedIn = false
                        })
                    Button(
                        "UserInfo",
                        action: {
                            if student != nil {
                                print("username \(student!.username)")
                                print("name \(student!.name)")
                                print("id \(student!.id)")
                                print(
                                    "stufe \(student!.classroom?.grade ?? 10)")
                                print(
                                    "classname \(student!.classroom?.name ?? "10")"
                                )
                                if let studentPoints = points.first(where: {
                                    $0.studentUUID == student?.id
                                }) {

                                    print("Punkte \(studentPoints.points) P")
                                }
                                if let studentQuizzes = storedQuizzes.first(where: {
                                    $0.studentUUID == student?.id
                                }) {
                                    for correctanswer in studentQuizzes.correctAnsweredQuestions{
                                        print("\(correctanswer) RICHTIG")
                                    }
                                    for falseanswer in studentQuizzes.falseAnsweredQuestions{
                                        print("\(falseanswer) FALSCH")
                                    }
                                    
                                }
                            }
                        })
                    VStack {
                        Text("Change Gade")
                        HStack {
                            Button(
                                "+",
                                action: {
                                    student?.classroom?.grade =
                                        ((student?.classroom?.grade ?? 1) + 1)
                                    print(
                                        "Klasse: \(student?.classroom?.grade ?? 0)"
                                    )
                                })
                            Button(
                                "-",
                                action: {
                                    student?.classroom?.grade =
                                        ((student?.classroom?.grade ?? 1) - 1)
                                    print(
                                        "Klasse: \(student?.classroom?.grade ?? 0)"
                                    )
                                })
                        }
                    }

                }
            }

        } else {

            LoginScreenView(loggedIn: $loggedIn, student: $student)
        }

    }
}

#Preview {
    BottomNav()
        .modelContainer(for: [Classroom.self, StoredQuizzes.self], inMemory: true)
}

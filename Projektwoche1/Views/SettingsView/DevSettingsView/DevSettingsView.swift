//
//  DevSettingsView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 08.11.24.
//

import SwiftUI
import SwiftData

struct DevSettingsView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    @Binding var student: Student?
    @Query var storedQuizzes: [StoredQuizzes]
    
    var body: some View {
        VStack{
                                VStack{
                                    Text("username \(student!.username)")
                                    Text("name \(student!.name)")
                                    Text(
                                        "stufe \(student!.classroom?.grade ?? 10)")
                                    Text(
                                        "classname \(student!.classroom?.name ?? "10")")
                                    if let studentPoints = points.first(where: {
                                        $0.studentUUID == student?.id
                                    }) {
            
                                        Text("Punkte \(studentPoints.points) P")
                                    }
                                }
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
                                           if let studentQuizzes = storedQuizzes.first(
                                               where: {
                                                   $0.studentUUID == student?.id
                                               })
                                           {
                                               for correctanswer in studentQuizzes
                                                   .correctAnsweredQuestions
                                               {
                                                   print("\(correctanswer) RICHTIG")
                                               }
                                               for falseanswer in studentQuizzes
                                                   .falseAnsweredQuestions
                                               {
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
}


#Preview {
    DevSettingsView(student: .constant(Student(username: "Student1", password: "password123", name: "Test 1")))
}

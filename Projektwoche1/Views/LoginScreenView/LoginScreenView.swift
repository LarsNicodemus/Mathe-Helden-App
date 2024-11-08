//
//  LoginScreenView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//

import SwiftData
import SwiftUI

struct LoginScreenView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginFailed: Bool = false
    @Binding var loggedIn: Bool
    @Binding var student: Student?
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var students: [Student]
    @Query var classrooms: [Classroom]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    @Query var storedQuizzes: [StoredQuizzes]
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                VStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.16))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            VStack {
                                ZStack {
                                    Image("cat")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Image(systemName: "graduationcap.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                        .offset(y: -40)
                                }
                                Text("LOGIN")
                                    .font(.largeTitle)
                                    .bold()
                                    .italic()
                            }
                        )
                }
                Spacer()
                TextField("Username", text: $username)
                    .padding()
                    .padding(.leading, 14)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "person.fill")
                            .padding(.leading, 8),
                        alignment: .leading
                    )
                SecureField("Password", text: $password)
                    .padding()
                    .padding(.leading, 14)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "lock.fill")
                            .padding(.leading, 8),
                        alignment: .leading
                    )
                Spacer()
                Button(action: handleLogin) {
                    Text("Login")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                if loginFailed {
                    Text("Invalid username or password")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
            }
            .padding()
        }
        .onAppear(perform: addTestStudents)
    }

    private func handleLogin() {
        if let actualStudent = students.first(where: {
            $0.username == username && $0.password == password
        }) {
            print("Login successful for student: \(actualStudent.username)")
            student = actualStudent
            loginFailed = false
            loggedIn = true
        } else {
            loginFailed = true
        }
    }
    private func addTestStudents() {
        let classRoom = Classroom(name: "TESTCLASSROOM", grade: 1)
        modelContext.insert(classRoom)
        let testStudent1 = Student(username: "S", password: "1",name: "Test 1", classroom: classrooms[0])
        modelContext.insert(testStudent1)
        let testStudent2 = Student(username: "Student2", password: "password456",name: "Test 2", classroom: classrooms[0])
        modelContext.insert(testStudent2)
        let leaderBoard = LeaderBoard(name: "TESTLEADERBOARD")
        modelContext.insert(leaderBoard)
        leaderBoard.classroom = classrooms[0]
        let points = Points(studentUUID: testStudent1.id, leaderBoard: leaderBoards[0])
        modelContext.insert(points)
        let points2 = Points(studentUUID: testStudent2.id,points: 50, leaderBoard: leaderBoards[0])
        modelContext.insert(points2)
        let quizzes = StoredQuizzes(studentUUID: testStudent1.id)
        modelContext.insert(quizzes)
        do {
            try modelContext.save()
            print("Test students added")
        } catch {
            print("Error saving test students: \(error)")
        }
    }

}

#Preview {
    LoginScreenView(loggedIn: .constant(true), student: .constant(Student(username: "Student1", password: "password123", name: "Test 1")))
        .modelContainer(for: [Student.self, StoredQuizzes.self], inMemory: true)
}

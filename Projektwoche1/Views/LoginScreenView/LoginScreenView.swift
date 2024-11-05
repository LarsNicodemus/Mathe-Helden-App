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
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var students: [Student]
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
        if let student = students.first(where: {
            $0.username == username && $0.password == password
        }) {
            print("Login successful for student: \(student.username)")
            loginFailed = false
            loggedIn = true
        } else {
            loginFailed = true
        }
    }
    private func addTestStudents() {
        let testStudent1 = Student(username: "Student1", password: "password123",name: "Test 1")
        let testStudent2 = Student(username: "Student2", password: "password456",name: "Test 2")
        
        modelContext.insert(testStudent1)
        modelContext.insert(testStudent2)
        
        do {
            try modelContext.save()
            print("Test students added")
        } catch {
            print("Error saving test students: \(error)")
        }
    }

}

#Preview {
    LoginScreenView(loggedIn: .constant(true))
        .modelContainer(for: [Student.self], inMemory: true)
}

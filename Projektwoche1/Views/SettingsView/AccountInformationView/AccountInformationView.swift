//
//  AccountInformationView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI
import SwiftData


struct AccountInformationView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Binding var student: Student?
    {
        didSet {
            email = student?.username ?? "Empty Email"
            password = student?.password ?? "123456"
        }
    }
    
    @State var email: String = "Empty Email"
    @State var password: String = "123456"
    
    @State private var showPassword = false
    
    
    var body: some View {
        VStack {
            Text("Account Einstellungen")
                .font(.largeTitle)
                .bold()
                .padding()
            HStack{
                AccountDataView(email: $email, password: $password)
            }
            .frame(width: 360, height: 250)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 3)
            )
            .padding(.bottom, 20)
            Spacer()
            Button(action: {
                guard (student?.id) != nil else { return }
                if let student = students.first(where: {
                    $0.id == student?.id
                }){
                    student.username = email
                    student.password = password
                    try? modelContext.save()
                }
                dismiss()
            }) {
                Text("Save")
                    .bold()
                    .frame(width: 200)
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .padding(30)
            
        }
        .onAppear {
            email = student?.username ?? "Empty Email"
            password = student?.password ?? "123456"
        }
    }
}

#Preview {
    AccountInformationView(student: .constant(Student(username: "Student1", password: "password123", name: "Test 1")))
}

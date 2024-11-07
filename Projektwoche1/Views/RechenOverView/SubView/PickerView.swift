//
//  PickerView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 07.11.24.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedDifficulty: Difficulty = .easy
      @State private var selectedOperation: Operation = .addition
      @State private var navigateToQuiz = false
    @Binding var student: Student?
    var body: some View {
        NavigationStack{
            VStack{
                RoundedRectangle(cornerSize: CGSize(width: 70, height: 25))
                    .frame(width: 305, height: 350)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.7), radius: 4, x: 0, y: 2)
                    .overlay(
                            VStack(spacing: 20) {
                                Text("Übungsaufgaben")
                                    .font(.title)
                                    .bold()
                                    .italic()
                                 Text("Wählen deinen Schwierigkeitsgrad")
                                 Picker("Schwierigkeitsgrad", selection: $selectedDifficulty) {
                                   Text("Leicht").tag(Difficulty.easy)
                                   Text("Mittel").tag(Difficulty.medium)
                                   Text("Schwer").tag(Difficulty.hard)
                                 }
                                 .pickerStyle(SegmentedPickerStyle())
                                 Text("Wähle die Rechenoperation")
                                 Picker("Operation", selection: $selectedOperation) {
                                   Image(systemName: "plus.circle")
                                    .tag(Operation.addition)
                                     Image(systemName: "minus.circle").tag(Operation.subtraction)
                                     Image(systemName: "multiply.circle").tag(Operation.multiplication)
                                     Image(systemName: "divide.circle").tag(Operation.division)
                                 }
                                 .pickerStyle(SegmentedPickerStyle())
                                
                                NavigationLink(destination: RechnenView(student: $student).navigationBarBackButtonHidden(true)){
                                    Text("Zum Quiz")
                                }
                                    .buttonStyle(PlainButtonStyle())
                                 .padding()
                                 .background(Color.blue)
                                 .foregroundColor(.white)
                                 .cornerRadius(8)
                                 
                               }
                               .padding()
                             
                        
                    )
            }
        }
        
    }
}

#Preview {
    PickerView(student: .constant(
        Student(
            username: "Student1", password: "password123",
            name: "Test 1")))
}

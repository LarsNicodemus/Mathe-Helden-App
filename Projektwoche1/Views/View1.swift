//
//  View1.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//
import SwiftUI
import SwiftData

struct SetupView: View {
    @State private var selectedDifficulty: Difficulty = .easy
    @State private var selectedOperation: Operation = .addition
    @State private var navigateToQuiz = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Wählen Sie den Schwierigkeitsgrad")
            Picker("Schwierigkeitsgrad", selection: $selectedDifficulty) {
                Text("Leicht").tag(Difficulty.easy)
                Text("Mittel").tag(Difficulty.medium)
                Text("Schwer").tag(Difficulty.hard)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Wählen Sie die Rechenoperation")
            Picker("Operation", selection: $selectedOperation) {
                Text("Addition").tag(Operation.addition)
                Text("Subtraktion").tag(Operation.subtraction)
                Text("Multiplikation").tag(Operation.multiplication)
                Text("Division").tag(Operation.division)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Zum Quiz") {
                navigateToQuiz = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .sheet(isPresented: $navigateToQuiz) {
                QuizView(difficulty: selectedDifficulty, operation: selectedOperation)
            }
        }
        .padding()
    }
}





#Preview {
    SetupView()
}


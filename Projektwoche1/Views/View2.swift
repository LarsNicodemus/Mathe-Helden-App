//
//  Untitled.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    let difficulty: Difficulty
    let operation: Operation

    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0
    @State private var userAnswer: String = ""
    @State private var isCorrect: Bool?
    @State private var correctAnswers = 0
    @State private var incorrectAnswers = 0

    // Context zum Speichern des Ergebnisses in SwiftData
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(spacing: 20) {
            Text("Rechenaufgabe")
            Text("\(firstNumber) \(operationSymbol()) \(secondNumber) = ?")
                .font(.largeTitle)
            
            TextField("Antwort", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Ergebnis prüfen") {
                checkAnswer()
            }
            .padding()
            .background(isCorrect == true ? Color.green : (isCorrect == false ? Color.red : Color.gray))
            .foregroundColor(.white)
            .cornerRadius(8)

            Button("Neue Aufgabe") {
                generateNewProblem()
                isCorrect = nil
                userAnswer = ""
            }
            .padding()
            
            Button("Quiz speichern") {
                saveQuizResult()
            }
            .padding()
        }
        .onAppear(perform: generateNewProblem)
    }

    func operationSymbol() -> String {
        switch operation {
        case .addition: return "+"
        case .subtraction: return "-"
        case .multiplication: return "×"
        case .division: return "÷"
        }
    }

    func checkAnswer() {
        let correctAnswer: Int
        switch operation {
        case .addition: correctAnswer = firstNumber + secondNumber
        case .subtraction: correctAnswer = firstNumber - secondNumber
        case .multiplication: correctAnswer = firstNumber * secondNumber
        case .division: correctAnswer = firstNumber / secondNumber
        }

        if let userIntAnswer = Int(userAnswer) {
            isCorrect = userIntAnswer == correctAnswer
            if isCorrect == true {
                correctAnswers += 1
            } else {
                incorrectAnswers += 1
            }
        } else {
            isCorrect = false
            incorrectAnswers += 1
        }
    }

    func generateNewProblem() {
        let range: ClosedRange<Int>
        switch difficulty {
        case .easy: range = 1...10
        case .medium: range = 10...100
        case .hard: range = 100...1000
        }

        firstNumber = Int.random(in: range)
        secondNumber = Int.random(in: range)
    }
    
    func saveQuizResult() {
        let quizResult = QuizResult(correctAnswers: correctAnswers, incorrectAnswers: incorrectAnswers)
        modelContext.insert(quizResult)
        
        do {
            try modelContext.save()
        } catch {
            print("Fehler beim Speichern des Quiz-Ergebnisses: \(error)")
        }
    }
}

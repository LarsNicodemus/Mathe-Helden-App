
//
//  QuizManager.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//
import SwiftUI
import SwiftData

class QuizManager {
    var operand1: Int = 0
    var operand2: Int = 0
    var operation: MathOperation = .addition
    var userAnswer: String = ""
    var isCorrect: Bool? = nil

    var correctAnswer: Int {
        switch operation {
        case .addition: return operand1 + operand2
        case .subtraktion: return operand1 - operand2
        case .multiplikation: return operand1 * operand2
        case .division: return operand2 != 0 ? operand1 / operand2 : 0
        }
    }

    func generateQuestion(
        grade: Int, difficulty: DifficultyLevel, operation: MathOperation
    ) {
        var range: ClosedRange<Int>
        let allowedOperations: [MathOperation]

        switch grade {
        case 1:
            range =
                difficulty == .leicht
                ? 1...10 : difficulty == .mittel ? 1...20 : 1...30
            allowedOperations = [.addition, .subtraktion]

        case 2:
            range =
                difficulty == .leicht
                ? 1...20 : difficulty == .mittel ? 1...50 : 1...70
            allowedOperations =
                [.addition, .subtraktion]
                + (difficulty != .leicht ? [.multiplikation] : [])

        case 3:
            range =
                difficulty == .leicht
                ? 1...50 : difficulty == .mittel ? 1...100 : 1...150
            allowedOperations =
                [.addition, .subtraktion, .multiplikation]
                + (difficulty != .leicht ? [.division] : [])

        case 4:
            range =
                difficulty == .leicht
                ? 1...100 : difficulty == .mittel ? 1...500 : 1...1000
            allowedOperations = [
                .addition, .subtraktion, .multiplikation, .division,
            ]

        default:
            range =
                difficulty == .leicht
                ? 1...100 : difficulty == .mittel ? 1...500 : 1...1000
            allowedOperations = [
                .addition, .subtraktion, .multiplikation, .division,
            ]
        }

        self.operation =
            allowedOperations.contains(operation)
            ? operation : allowedOperations.randomElement()!

        repeat {
            if self.operation == .multiplikation {
                let multiplicationRange =
                    grade == 1
                    ? 1...5
                    : grade == 2
                        ? (difficulty == .leicht ? 1...5 : 1...10) : 1...12
                operand1 = Int.random(in: multiplicationRange)
                operand2 = Int.random(in: multiplicationRange)

            } else if self.operation == .division {
                let divisionRange =
                    grade == 2
                    ? 1...5
                    : grade == 3
                        ? (difficulty == .leicht ? 1...10 : 1...20) : 1...50
                operand1 = Int.random(in: divisionRange)
                operand2 = Int.random(in: divisionRange)

            } else {
                operand1 = Int.random(in: range)
                operand2 = Int.random(in: range)
            }
        } while (self.operation == .division
            && (operand2 == 0 || operand1 % operand2 != 0))
            || (self.operation == .subtraktion && operand1 < operand2)
    }

    func checkAnswer() -> Bool {
        if let answer = Int(userAnswer), answer == correctAnswer {
            isCorrect = true
        } else {
            isCorrect = false
        }
        return isCorrect ?? false
    }

    func resetAnswer() {
        userAnswer = ""
        isCorrect = nil
    }
}

//
//  RechenBottomView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftData
import SwiftUI

struct RechenBottomView: View {
    @Environment(\.modelContext) private var context
    @AppStorage("result") var ergebnis: String = ""
    @Binding var showFeedback: Bool
    var quizMaster: QuizManager
    @Binding var userAnswer: String
    @Binding var isCorrect: Bool?
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    @Query var storedQuizzes: [StoredQuizzes]
    @Binding var student: Student?
    var diffycultyLevel: DifficultyLevel

    var body: some View {
        VStack {

            VStack(spacing: 10) {
                ForEach(0..<3) { row in
                    HStack(spacing: 10) {
                        ForEach(1...3, id: \.self) { col in
                            let number = row * 3 + col
                            Button(action: {
                                userAnswer.append("\(number)")
                            }) {
                                Text("\(number)")
                                    .frame(width: 70, height: 45)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 8)
                                    )
                                    .shadow(
                                        color: Color.black.opacity(0.7),
                                        radius: 4, x: 0, y: 2)
                            }
                        }
                    }
                }

                HStack(spacing: 10) {
                    Button(action: {
                        if !userAnswer.isEmpty {
                            userAnswer.removeLast()
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 70, height: 45)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(
                                    color: Color.black.opacity(0.7), radius: 4,
                                    x: 0, y: 2)

                            Image(systemName: "delete.left.fill")
                                .resizable()
                                .frame(width: 34, height: 34)
                                .tint(.white)
                        }
                    }

                    Button(action: {
                        userAnswer.append("0")
                    }) {
                        Text("0")
                            .frame(width: 70, height: 45)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(
                                color: Color.black.opacity(0.7), radius: 4,
                                x: 0, y: 2)
                    }

                    Button(action: {
                        userAnswer = ""
                        showFeedback = false
                    }) {
                        Text("X")
                            .frame(width: 70, height: 45)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(
                                color: Color.black.opacity(0.7), radius: 4,
                                x: 0, y: 2)
                    }
                }
                .frame(maxWidth: .infinity)

            }
            Button(action: {
                quizMaster.userAnswer = userAnswer
                showFeedback = true
                isCorrect = quizMaster.checkAnswer()
                let questionAnswer: String =
                    "Antwort: \(quizMaster.userAnswer) / Aufgabe: \(quizMaster.operand1) \(quizMaster.operation) \(quizMaster.operand2) = \(quizMaster.correctAnswer)"
                if isCorrect == true {
                    if let storedQuiz = storedQuizzes.first(where: {
                        $0.studentUUID == student?.id
                    }) {
                        storedQuiz.correctAnsweredQuestions.append(
                            questionAnswer)
                    }
                } else {
                    if let storedQuiz = storedQuizzes.first(where: {
                        $0.studentUUID == student?.id
                    }) {
                        storedQuiz.falseAnsweredQuestions.append(
                            questionAnswer)
                    }
                }
                if isCorrect == true {
                    //                    if let storedQuiz = storedQuizzes.first(where: {$0.studentUUID == student?.id}){
                    //                        storedQuiz.correctAnsweredQuestions.append(questionAnswer)
                    //                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        userAnswer = ""
                        showFeedback = false
                        isCorrect = nil
                        let randomOperation: MathOperation =
                            MathOperation.allCases.randomElement() ?? .addition
                        quizMaster.generateQuestion(
                            grade: student?.classroom?.grade ?? 2,
                            difficulty: diffycultyLevel,
                            operation: randomOperation)
                        quizMaster.resetAnswer()
                    }
                    guard let studentUUID = student?.id else { return }
                    if let studentPoints = leaderBoards[0].points.first(where: {
                        points in
                        points.studentUUID == studentUUID
                    }) {
                        //                        if let storedQuiz = storedQuizzes.first(where: {
                        //                            $0.studentUUID == studentUUID
                        //                        }) {
                        //                            storedQuiz.correctAnsweredQuestions.append(
                        //                                questionAnswer)
                        //                            for quiz in storedQuiz.correctAnsweredQuestions {
                        //                                print(quiz)
                        //                            }
                        //                        }
                        studentPoints.points += 10
                        try? context.save()
                        print("aktuelle Punkte \(studentPoints.points)")
                        print("aktuelles Level \(diffycultyLevel)")
                    }
                }
                //                if let storedQuiz = storedQuizzes.first(where: { $0.studentUUID == student?.id }) {
                //                    if !storedQuiz.correctAnsweredQuestions.isEmpty{
                //                        for quiz in storedQuiz.correctAnsweredQuestions {
                //                            print(quiz)
                //                        }
                //                    }
                //                    if !storedQuiz.falseAnsweredQuestions.isEmpty{
                //                        for quiz in storedQuiz.falseAnsweredQuestions {
                //                            print(quiz)
                //                        }
                //                    }
                //                }
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 230, height: 45)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .tint(.orange)
                        .shadow(
                            color: Color.black.opacity(0.7), radius: 4, x: 0,
                            y: 2)

                    Text("OK")
                        .bold()
                        .tint(.white)
                }
            }
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(
            Image("meadow2")
                .resizable()
                .ignoresSafeArea(edges: .top)
        )
    }
}

#Preview {
    RechenBottomView(
        showFeedback: .constant(true), quizMaster: QuizManager(),
        userAnswer: .constant(""), isCorrect: .constant(true),
        student: .constant(
            Student(
                username: "Student1", password: "password123",
                name: "Test 1")), diffycultyLevel: .leicht)
}

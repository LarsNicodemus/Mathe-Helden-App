//
//  RechenViewBonus.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 07.11.24.
//

import SwiftData
import SwiftUI

struct RechnenViewBonus: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var points: [Points]
    @Query var storedQuizzes: [StoredQuizzes]
    @Binding var student: Student?
    @State private var showFeedback: Bool = false
    @State private var userAnswer = ""
    @State private var isCorrect: Bool? = nil
    @State private var quizMaster: QuizManager = QuizManager()
    var studentPoints: Int {
            if let studentUUID = student?.id {
                return points.first(where: { $0.studentUUID == studentUUID })?.points ?? 0
            }
            return 0
        }
    
    init(student: Binding<Student?>) {
            _student = student
               
        let randomOperation: MathOperation = MathOperation.allCases.randomElement() ?? .addition
                quizMaster.generateQuestion(
                    grade: student.wrappedValue?.classroom?.grade ?? 2,
                    difficulty: .schwer,
                    operation: randomOperation
                )
            }
    
    var body: some View {

        VStack {
            
            RechenHeaderViewBonus(
                showFeedback: $showFeedback,
                userAnswer: $userAnswer,
                isCorrect: $isCorrect,
                quizMaster: quizMaster,
                student: $student,
                studentPoints: studentPoints
            )
            RechenBottomViewBonus(
                showFeedback: $showFeedback,
                quizMaster: quizMaster,
                userAnswer: $userAnswer,
                isCorrect: $isCorrect,
                student: $student
            )
        }
      }

  }

#Preview {
    VStack {
        RechnenViewBonus(
            student: .constant(
                Student(
                    username: "Student1", password: "password123",
                    name: "Test 1"))
        )
        .modelContainer(for: [Classroom.self, StoredQuizzes.self], inMemory: true)
        Spacer().frame(height: 60)
    }
}

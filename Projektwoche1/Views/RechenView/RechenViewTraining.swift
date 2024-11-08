//
//  RechenViewTraining.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 07.11.24.
//

import SwiftData
import SwiftUI

struct RechnenViewTraining: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) private var dismiss
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Binding var student: Student?
    @State private var showFeedback: Bool = false
    @State private var userAnswer = ""
    @State private var isCorrect: Bool? = nil
    @State private var quizMaster: QuizManager = QuizManager()
    @Binding var difficulty: DifficultyLevel
    @Binding var operation: MathOperation
 
    
    var body: some View {

        VStack {
            
            RechenHeaderViewTraining(
                showFeedback: $showFeedback,
                userAnswer: $userAnswer,
                isCorrect: $isCorrect,
                quizMaster: quizMaster,
                student: $student
            )
            RechenBottomViewTraining(
                showFeedback: $showFeedback,
                quizMaster: quizMaster,
                userAnswer: $userAnswer,
                isCorrect: $isCorrect,
                student: $student,
                difficulty: $difficulty,
                operation: $operation
            )
        }
        .onAppear{
            quizMaster.generateQuestion(
                            grade: student?.classroom?.grade ?? 2,
                            difficulty: difficulty,
                            operation: operation
                        )
        }
      }

  }

#Preview {
    VStack {
        RechnenViewTraining(
            student: .constant(
                Student(
                    username: "Student1", password: "password123",
                    name: "Test 1")), difficulty: .constant(.leicht), operation: .constant(.addition)
        )
        .modelContainer(for: Classroom.self, inMemory: true)
        Spacer().frame(height: 60)
    }
}

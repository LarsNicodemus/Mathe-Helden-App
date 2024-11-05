//
//  RechnenView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI
import SwiftData


struct RechnenView: View {
    @Environment(\.modelContext) private var context
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @AppStorage("result") private var ergebnis: String = ""
    @State private var showFeedback: Bool = false
    @State private var userAnswer = ""
    @State private var isCorrect: Bool? = nil
    @State private var quizMaster: QuizManager = {
            let qm = QuizManager()
            let randomOperation: MathOperation = MathOperation.allCases.randomElement() ?? .addition
        qm.generateQuestion(grade: 2,difficulty: .schwer, operation: randomOperation)
            return qm
        }()

    var body: some View {
        
        VStack {
            
            RechenHeaderView(
                showFeedback: $showFeedback,
                userAnswer: $userAnswer,
                isCorrect: $isCorrect,
                quizMaster: quizMaster
            )
            RechenBottomView(
                showFeedback: $showFeedback,
                quizMaster: quizMaster,
                userAnswer: $userAnswer,
                isCorrect: $isCorrect
            )
        }
        
    }
}


#Preview {
    VStack{
        RechnenView()
            .modelContainer(for: Classroom.self, inMemory: true)
        Spacer().frame(height: 60)
    }
}



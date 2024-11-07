//
//  RechenHeaderViewBonus.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 07.11.24.
//

import SwiftUI
import SwiftData

struct RechenHeaderViewBonus: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @AppStorage("result") var ergebnis: String = ""
    @Binding var showFeedback: Bool
    @Binding var userAnswer: String
    @Binding var isCorrect: Bool?
    var quizMaster: QuizManager
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    @Query var storedQuizzes: [StoredQuizzes]
    @Binding var student: Student?
    var diffycultyLevel: DifficultyLevel
    var studentPoints: Int
    var easy: Int
    var medium: Int
    var hard: Int
    @State private var progress = 0.0
    @State private var minVolume = 0.0
    @State private var maxVolume = 10.0
    var storedQuizzesCount: Int {
            if let studentUUID = student?.id {
                return storedQuizzes.first(where: { $0.studentUUID == studentUUID })?.bonusQuestions.count ?? 0
            }
            return 0
        }
    var body: some View {
        VStack {
            
            HStack {
                Button(action:{
                dismiss()
              }){
                Image(systemName:"arrow.left")
                  .foregroundColor(.black)
                  .overlay(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(Color.black.opacity(0.1))
                      .padding(-12)
                  )
              }
              .padding(.trailing, 16)
                Image(systemName: "pesetasign")
                    .foregroundColor(.yellow)
                Gauge(value: progress, in: minVolume...maxVolume) {
                } currentValueLabel: {
                    
                } minimumValueLabel: {
                    Text("\(Int(minVolume))")
                        .bold()
                        .foregroundColor(.yellow)
                } maximumValueLabel: {
                    Text("\(Int(maxVolume))")
                }
                
            }
            .frame(width: 320)
            .padding()
            
            
            VStack(spacing: 20) {
                HStack(spacing: 16) {
                    Text("\(quizMaster.operand1)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.purple)
                    Text(quizMaster.operation.rawValue)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                    Text("\(quizMaster.operand2)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.purple)
                }
                
                HStack(spacing: 8) {
                    Text("=")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                    Text(userAnswer.isEmpty ? "?" : userAnswer)
                        .font(.system(size: 36, weight: .bold))
                        .frame(width: 100, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.green)
                }
            }
            .padding()
            .frame(width: 330, height: 240)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.brown.opacity(0.2)))
            
            if showFeedback && storedQuizzesCount < 10  {
                Text(isCorrect == true ? "🎉 Richtig! Super gemacht! 🎉" : "❌ Oops! Versuch es nochmal! ❌")
                    .font(.title2)
                    .foregroundColor(isCorrect == true ? .green : .red)
                    .padding()
            }
            if storedQuizzesCount >= 10 {
                Text("🎉 Alle Bonusfragen erledigt! 🎉")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding()
            }
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            Image("kidsplaying")
                .resizable()
                .ignoresSafeArea(edges: .top)
        )
        .onAppear {
            updateMinMaxVolume()
        }
        .onChange(of: studentPoints) {
            updateMinMaxVolume()
        }
        .onChange(of: storedQuizzesCount){
            if storedQuizzesCount >= 10 {
                isCorrect = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    dismiss()
//                    resetBonusQuestions()
                }
            }
        }
        
    }
    private func updateMinMaxVolume() {
            progress = Double(storedQuizzesCount)
        }
    private func resetBonusQuestions() {
        if let storedQuiz = storedQuizzes.first(where: { $0.studentUUID == student?.id }) {
            storedQuiz.bonusQuestions = []
        }
    }
}

#Preview {

    RechenHeaderViewBonus(showFeedback: .constant(true), userAnswer: .constant(""), isCorrect: .constant(true), quizMaster: QuizManager(),
                     student: .constant(
                         Student(
                             username: "Student1", password: "password123",
                             name: "Test 1")), diffycultyLevel: .leicht, studentPoints: 80, easy: 30, medium: 100, hard: 999)
        
    
    
}

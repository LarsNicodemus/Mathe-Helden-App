//
//  RechenHeaderViewTraining.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 07.11.24.
//

import SwiftUI
import SwiftData

struct RechenHeaderViewTraining: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Binding var showFeedback: Bool
    @Binding var userAnswer: String
    @Binding var isCorrect: Bool?
    var quizMaster: QuizManager
    @Binding var student: Student?

    
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
                    Spacer()
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
            
            if showFeedback  {
                Text(isCorrect == true ? "🎉 Richtig! Super gemacht! 🎉" : "❌ Oops! Versuch es nochmal! ❌")
                    .font(.title2)
                    .foregroundColor(isCorrect == true ? .green : .red)
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
        
        
  
    }
   
}

#Preview {

    RechenHeaderViewTraining(showFeedback: .constant(true), userAnswer: .constant(""), isCorrect: .constant(true), quizMaster: QuizManager(),
                     student: .constant(
                         Student(
                             username: "Student1", password: "password123",
                             name: "Test 1")))
        
    
    
}

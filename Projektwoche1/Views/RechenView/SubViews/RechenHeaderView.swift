//
//  RechenHeaderView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct RechenHeaderView: View {
    @AppStorage("result") var ergebnis: String = ""
    @Binding var showFeedback: Bool
    @Binding var userAnswer: String
    @Binding var isCorrect: Bool?
    var quizMaster: QuizManager

    var body: some View {
        VStack {
            HStack {
                Text("0")
                    .font(.headline)
                ProgressView(value: 0.3)
                    .frame(width: 100)
                Image(systemName: "coin.fill")
                    .foregroundColor(.yellow)
            }
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
            
            if showFeedback {
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

    RechenHeaderView(showFeedback: .constant(true), userAnswer: .constant(""), isCorrect: .constant(true), quizMaster: QuizManager())
        
    
    
}

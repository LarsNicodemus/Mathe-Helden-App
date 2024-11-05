//
//  RechenHeaderView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct RechenHeaderView: View {
    @Binding var selectedPrice: String
    @Binding var enteredNumber: String
    @AppStorage("result") var ergebnis: String = ""
    @Binding var answer: String
    @Binding var showFeedback: Bool
    @Binding var number1: Int
    @Binding var number2: Int
    var correctAnswer: Int {
        number1 + number2
    }
    var body: some View {
        VStack{
            HStack {
                    Text("0")
                        .font(.headline)
                    ProgressView(value: 0.3)
                        .frame(width: 100)
                    Image(systemName: "coin.fill")
                        .foregroundColor(.yellow)
                }
                .padding()
            Spacer().frame(height: 30)
            VStack{
                HStack(spacing: 16) {
                    Text("\(number1)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.purple)
                    Text("+")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                    Text("\(number2)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.purple)
                }
                HStack(spacing: 8) {
                    Text("=")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.orange)
                    Text(ergebnis != "" ? "\(ergebnis)" : "?")
                        .font(.system(size: 36, weight: .bold))
                        .frame(width: 100, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.green)
                }
            }
            .frame(width: 330, height: 300)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.brown.opacity(0.2))
            )
            if showFeedback {
                if Int(ergebnis) == correctAnswer {
                    Text("🎉 Richtig! Super gemacht! 🎉")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding()
                } else {
                    Text("❌ Oops! Versuch es nochmal! ❌")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding()
                }
                
            }
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("kidsplaying")
                .resizable()
                .ignoresSafeArea()
            
        )
    }
}

#Preview {
    RechenHeaderView(selectedPrice: .constant("2"), enteredNumber: .constant("4"), answer: .constant("4"), showFeedback: .constant(true), number1: .constant(1), number2: .constant(3))
}

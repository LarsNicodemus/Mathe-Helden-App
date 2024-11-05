//
//  Test.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct RechnungView: View {
    @State private var answer: String = ""
    @State private var showFeedback: Bool = false
    let number1: Int
    let number2: Int
    
    var correctAnswer: Int {
        number1 + number2
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Titel
            Text("Let's Do Some Math!")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(.top, 40)

            // Rechnung
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
            
            // Gleichheitszeichen und Eingabefeld
            HStack(spacing: 8) {
                Text("=")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.orange)
                TextField("Answer", text: $answer)
                    .keyboardType(.numberPad)
                    .font(.system(size: 36, weight: .bold))
                    .frame(width: 100)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.green)
            }
            
            // Button zum Überprüfen der Antwort
            Button(action: {
                showFeedback = true
            }) {
                Text("Check Answer")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            
            // Feedback
            if showFeedback {
                if Int(answer) == correctAnswer {
                    Text("🎉 Correct! Great Job! 🎉")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding()
                } else {
                    Text("❌ Oops! Try Again! ❌")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemYellow).opacity(0.1))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

struct RechnungView_Previews: PreviewProvider {
    static var previews: some View {
        RechnungView(number1: 3, number2: 4)
    }
}

#Preview {
    RechnungView(number1: 3, number2: 4)
//        .modelContainer(for: [])
}

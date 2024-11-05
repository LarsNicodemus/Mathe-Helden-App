//
//  RechenBottomView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct RechenBottomView: View {
    @AppStorage("result") var ergebnis: String = ""
    @Binding var showFeedback: Bool
    var body: some View {
        VStack{
            VStack(spacing: 10) {
                ForEach(0..<3) { row in
                    HStack(spacing: 10) {
                        ForEach(1...3, id: \.self) { col in
                            let number = row * 3 + col
                            Button(action: {
                                ergebnis.append("\(number)")
                                
                            }) {
                                Text("\(row * 3 + col)")
                                    .frame(width: 70, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .shadow(color: Color.black.opacity(0.7), radius: 4, x: 0, y: 2)
                            }
                        }
                    }
                }
            }
            HStack{
                Button("OK"){
                    showFeedback = true
                }
                .buttonStyle(.borderedProminent)
                Button("X"){
                    ergebnis = ""
                    showFeedback = false
                }
                .buttonStyle(.borderedProminent)
            }
            
            
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color.brown.opacity(0.2))
        
    }
}

#Preview {
    RechenBottomView(showFeedback: .constant(true))
}

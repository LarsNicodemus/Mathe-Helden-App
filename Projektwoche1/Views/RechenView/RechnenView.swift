//
//  RechnenView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct RechnenView: View {
    @State private var selectedPrice: String = ""
    @State private var enteredNumber: String = ""
    @AppStorage("result") private var ergebnis: String = ""
//    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 15), count: 4)
    @State private var answer: String = ""
    @State private var showFeedback: Bool = false
    @State var number1: Int = 1
    @State var number2: Int = 3
    
    
    var body: some View {
        VStack {
            
            
                    RechenHeaderView(
                        selectedPrice: $selectedPrice,
                        enteredNumber: $enteredNumber,
                        answer: $answer,
                        showFeedback: $showFeedback,
                        number1: $number1,
                        number2: $number2
                    )
                    
                    
                    RechenBottomView(showFeedback: $showFeedback)
                        
                        
                }
                .background(Color(.systemGray6))
            }
        }

#Preview {
    RechnenView()
}



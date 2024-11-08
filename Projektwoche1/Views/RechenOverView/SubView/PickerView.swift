//
//  PickerView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 07.11.24.
//

import SwiftUI
import SwiftData

struct PickerView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Binding var difficulty: DifficultyLevel
      @Binding var operation: MathOperation
      @State private var navigateToQuiz = false
    @Binding var student: Student?
    var body: some View {
        NavigationStack{
            VStack{
                RoundedRectangle(cornerSize: CGSize(width: 70, height: 25))
                    .frame(width: 305, height: 350)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.7), radius: 4, x: 0, y: 2)
                    .overlay(
                            VStack(spacing: 20) {
                                Text("Übungsaufgaben")
                                    .font(.title)
                                    .bold()
                                    .italic()
                                 Text("Wählen deinen Schwierigkeitsgrad")
                                Picker("Schwierigkeitsgrad", selection: $difficulty) {
                                     Text("Leicht").tag(DifficultyLevel.leicht)
                                     Text("Mittel").tag(DifficultyLevel.mittel)
                                     Text("Schwer").tag(DifficultyLevel.schwer)
                                 }
                                 .pickerStyle(SegmentedPickerStyle())
                                 Text("Wähle die Rechenoperation")
                                Picker("Operation", selection: $operation) {
                                   Image(systemName: "plus.circle")
                                    .tag(MathOperation.addition)
                                    Image(systemName: "minus.circle").tag(MathOperation.subtraktion)
                                    Image(systemName: "multiply.circle").tag(MathOperation.multiplikation)
                                     Image(systemName: "divide.circle").tag(MathOperation.division)
                                 }
                                 .pickerStyle(SegmentedPickerStyle())
                                
                                NavigationLink(destination: RechnenViewTraining(student: $student, difficulty: $difficulty,operation: $operation).navigationBarBackButtonHidden(true)){
                                    Text("Zum Quiz")
                                }
                                    .buttonStyle(PlainButtonStyle())
                                 .padding()
                                 .background(Color.blue)
                                 .foregroundColor(.white)
                                 .cornerRadius(8)
                                 
                               }
                               .padding()
                             
                        
                    )
            }
        }
        
    }
}

#Preview {
    PickerView(difficulty: .constant(
        .leicht), operation: .constant(.addition), student: .constant(Student(
            username: "Student1", password: "password123",
            name: "Test 1")))
}


//
//  RechenOverView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 07.11.24.
//

import SwiftUI

struct RechenOverView: View {
    @Binding var student: Student?
    var body: some View {
        NavigationStack {
            VStack{
                Text("Mathe-Helden")
                    .font(.system(size: 46))
                    .bold()
                    .shadow(color: Color.black.opacity(0.7), radius: 4, x: 0, y: 2)
                HStack {
                    NavigationLink(destination: RechnenView(student: $student).navigationBarBackButtonHidden(true)) {
                        NavCardLeftView()
                            
                    }
                    NavigationLink(destination: RechnenView(student: $student).navigationBarBackButtonHidden(true)) {
                        NavCardRightView()
                        }
                    
                    
                }
                .padding(5)
                PickerView(student: $student)
                PlacePointsView()
                Spacer()
                
            }
            .background(
                Color.blue.opacity(0.2)
            )
            .foregroundColor(.black)
        }
    }
}

#Preview {
    RechenOverView(student: .constant(
        Student(
            username: "Student1", password: "password123",
            name: "Test 1"))
)
}

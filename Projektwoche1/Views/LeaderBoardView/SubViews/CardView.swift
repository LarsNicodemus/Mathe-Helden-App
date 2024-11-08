//
//  CardView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI
import SwiftData

struct CardView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    var placement: Int
    var studentName: String
    var studentPoints: Int
    
    var body: some View {
        
        HStack {
            Text("\(placement)")
                .font(.largeTitle)
                .bold()
            Spacer()
            HStack{
                Image("cat")
                    .resizable()
                    .frame(width: 70, height: 70)
                Spacer().frame(width: 20)
                VStack(alignment: .leading) {
                    Text(studentName)
                    Divider()
                        .overlay(Color.black)
                        .padding(.trailing, 50)
                    
                    HStack {
                        Label("(\(studentPoints)) pts", systemImage: "pesetasign.circle.fill")
                    }
                }
                Spacer()
                HStack {
                    Text("+1")
                    Image(systemName: "arrowtriangle.up.fill")
                }
                .padding(4)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray6))
            )
        }
        .background(Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CardView(placement: 1, studentName: "Cat Name 1", studentPoints: 100)
}

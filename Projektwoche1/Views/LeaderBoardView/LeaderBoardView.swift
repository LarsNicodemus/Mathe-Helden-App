//
//  LeaderBoardView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI
import SwiftData


struct LeaderBoardView: View {
    @Environment(\.modelContext) private var context
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]
    @Binding var student: Student?
    @State private var selectedTab: LeaderBoardText = .monthly
    var body: some View {
        
        NavigationStack{
            VStack{
                LeaderBoardHeaderView()

                Spacer()
                    .frame(maxWidth: .infinity)
                    .overlay {
                        VStack {
                            Picker("Selected Tab", selection: $selectedTab) {
                                ForEach(LeaderBoardText.allCases) { kiddoEntry in
                                    Text(kiddoEntry.rawValue).tag(kiddoEntry)
                                    
                                }
                                
                            }
                            
                            .pickerStyle(.segmented)
                            
                            
                            .padding()
                            
                            List {
                                CardView()
                                    .listRowBackground(Color.clear)
                                CardView()
                                    .listRowBackground(Color.clear)
                                CardView()
                                    .listRowBackground(Color.clear)
                            }
                            .listStyle(.plain)
                            
                        }
                        .background(
                            Rectangle()
                                .fill(.blue)
                                .clipShape(
                                    .rect(topLeadingRadius: 20,
                                          topTrailingRadius: 20)
                                )
                        )
                    }
            }
        }
    }
}

#Preview {
    LeaderBoardView(student: .constant(Student(username: "Student1", password: "password123", name: "Test 1")))
        .modelContainer(for: Classroom.self, inMemory: true)
}

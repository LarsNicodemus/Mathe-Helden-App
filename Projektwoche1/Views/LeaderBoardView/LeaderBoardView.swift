//
//  LeaderBoardView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftData
import SwiftUI

struct LeaderBoardView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var classrooms: [Classroom]
    @Query var students: [Student]
    @Query var leaderBoards: [LeaderBoard]
    @Query var teachers: [Teacher]
    @Query var points: [Points]

    @Binding var student: Student?

    @State private var selectedTab: LeaderBoardText = .monthly

    func getTop5LeaderBoard() -> [Points] {
        guard let leaderboard = leaderBoards.first else { return [] }

        let sortedPoints = leaderboard.points.sorted { $0.points > $1.points }

        return Array(sortedPoints.prefix(5))
    }

    func getRank(for studentUUID: UUID) -> Int? {
        guard let leaderboard = leaderBoards.first else { return nil }

        let sortedPoints = leaderboard.points.sorted { $0.points > $1.points }

        if let index = sortedPoints.firstIndex(where: {
            $0.studentUUID == studentUUID
        }) {
            return index + 1
        }
        return nil
    }

    var body: some View {
        NavigationStack {
            VStack {
                LeaderBoardHeaderView()

                Spacer()
                    .frame(maxWidth: .infinity)
                    .overlay {
                        VStack {
                            Picker("Selected Tab", selection: $selectedTab) {
                                ForEach(LeaderBoardText.allCases) {
                                    kiddoEntry in
                                    Text(kiddoEntry.rawValue).tag(kiddoEntry)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding()

                            List(getTop5LeaderBoard(), id: \.studentUUID) {
                                points in
                                VStack(alignment: .leading) {
                                    if let student = students.first(where: {
                                        $0.id == points.studentUUID
                                    }) {
                                    

                                    if let rank = getRank(
                                        for: points.studentUUID)
                                    {
                                
                                        CardView(placement: rank, studentName: student.name, studentPoints: points.points)
                                            
                                            
                                    }
                                }
                                }
                                .listRowBackground(Color.clear)
                            }
                            
                            .listStyle(.plain)
                        }
                        .background(
                            Rectangle()
                                .fill(.blue)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 20,
                                        topTrailingRadius: 20)
                                )
                        )
                    }
            }
        }
    }
}

#Preview {
    LeaderBoardView(
        student: .constant(
            Student(
                username: "Student1", password: "password123", name: "Test 1"))
    )
    .modelContainer(for: Classroom.self, inMemory: true)
}

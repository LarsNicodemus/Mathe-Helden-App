//
//  PlacePointsView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 07.11.24.
//

import SwiftData
import SwiftUI

struct PlacePointsView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query var leaderBoards: [LeaderBoard]
    @Binding var student: Student?

    func calculateRank(for studentUUID: UUID) -> Int? {
        guard let leaderboard = leaderBoards.first else { return nil }
        guard
            leaderboard.points.first(where: {
                $0.studentUUID == studentUUID
            }) != nil
        else { return nil }

        let sortedPoints = leaderboard.points.sorted { $0.points > $1.points }


        if let index = sortedPoints.firstIndex(where: {
            $0.studentUUID == studentUUID
        }) {
            return index + 1
        }
        return nil
    }

    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(width: 70, height: 20))
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.orange, .yellow]),
                        startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: 370, height: 80)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(1), radius: 4, x: 0, y: 2)
                .overlay(
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 140, height: 70)
                            .padding()
                            .overlay(
                                VStack {
                                    Text("Du bist Platz")
                                        .bold()
                                    if let studentUUID = student?.id,
                                        let rank = calculateRank(
                                            for: studentUUID)
                                    {
                                        Text("\(rank)")
                                            .font(.largeTitle)
                                            .bold()
                                            .italic()
                                    } else {
                                        Text("Unbekannt")
                                            .font(.title3)
                                            .italic()
                                    }
                                }
                            )
                        VStack(alignment: .leading) {
                            Text("Du besitzt:")
                                .font(.title3)
                                .bold()

                            HStack {

                                if let studentUUID = student?.id,
                                    let leaderboard = leaderBoards.first,
                                    let studentPoints = leaderboard.points
                                        .first(where: {
                                            $0.studentUUID == studentUUID
                                        })
                                {
                                    Text("\(studentPoints.points)")
                                        .bold()
                                        .italic()
                                    Image(systemName: "pesetasign")
                                        .font(.system(size: 16))
                                } else {
                                    Text("Keine Punkte")
                                        .bold()
                                        .italic()
                                    Spacer().frame(width: 16)
                                    Image(systemName: "pesetasign")
                                        .font(.system(size: 16))
                                }
                            }
                        }

                    }
                )
        }
    }
}

#Preview {
    PlacePointsView(
        student: .constant(
            Student(
                username: "Student1", password: "password123",
                name: "Test 1")))
}

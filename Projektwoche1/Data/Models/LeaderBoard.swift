//
//  LeaderBoard.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//
import SwiftUI
import SwiftData

@Model
class LeaderBoard {
    var id: UUID
    
    var name: String
    
    var classroom: Classroom?
    @Relationship(inverse: \Points.leaderBoard)
    var points: [Points]
    
    init(id: UUID = UUID(), name: String, classroom: Classroom? = nil, points: [Points] = []) {
        self.id = id
        self.name = name
        self.classroom = classroom
        self.points = points
    }
}

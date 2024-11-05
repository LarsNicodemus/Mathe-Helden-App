//
//  Points.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//

import SwiftUI
import SwiftData

@Model
class Points {
    var id: UUID
    
    var studentUUID: UUID
    var points: Int
    var leaderBoard: LeaderBoard?
    
    init(id: UUID = UUID(), studentUUID: UUID, points: Int = 0, leaderBoard: LeaderBoard? = nil) {
        self.id = id
        self.studentUUID = studentUUID
        self.points = points
        self.leaderBoard = leaderBoard
    }
}

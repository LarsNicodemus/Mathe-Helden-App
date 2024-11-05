//
//  Classroom.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//

import Foundation
import SwiftData

@Model
class Classroom {
    var id: UUID
    
    var name: String
    var grade: Int
    
    @Relationship(inverse: \Student.classroom)
    var students: [Student]
    @Relationship(inverse: \Teacher.classrooms)
    var teachers: [Teacher]
    @Relationship(inverse: \LeaderBoard.classroom)
    var leaderboards: [LeaderBoard]
    
    init(id: UUID = UUID(), name: String, grade: Int, students: [Student] = [], teachers: [Teacher] = [], leaderboards: [LeaderBoard] = []) {
        self.id = id
        self.name = name
        self.grade = grade
        self.students = students
        self.teachers = teachers
        self.leaderboards = leaderboards
    }
}

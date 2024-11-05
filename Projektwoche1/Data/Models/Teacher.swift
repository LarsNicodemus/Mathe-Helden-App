//
//  Teacher.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//

import SwiftUI
import SwiftData

@Model
class Teacher {
    var id: UUID
    
    var name: String
    var classrooms: [Classroom]
    
    init(id: UUID = UUID(), name: String, classrooms: [Classroom] = []) {
        self.id = id
        self.name = name
        self.classrooms = classrooms
    }
}

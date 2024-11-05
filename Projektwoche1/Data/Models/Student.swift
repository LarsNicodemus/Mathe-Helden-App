//
//  Student.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//

import SwiftUI
import SwiftData
@Model
class Student {
    var id: UUID
    @Attribute(.unique) var username: String
    var password: String
    
    var name: String
    var classroom: Classroom?
    
    init(id: UUID = UUID(),username: String,password: String, name: String, classroom: Classroom? = nil) {
        self.id = id
        self.username = username
        self.password = password
        self.name = name
        self.classroom = classroom
    }
}

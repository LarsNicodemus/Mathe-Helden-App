//
//  Enums.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

enum LeaderBoardText: String,  Identifiable, CaseIterable, Codable {
    case monthly = "Monatlich"
    case yearly = "Jährlich"
    
    var id: String {
            self.rawValue
        }
}

enum DifficultyLevel {
    case leicht, mittel, schwer
}

enum MathOperation: String,  Identifiable, CaseIterable, Codable {
    case addition = "+"
    case subtraktion = "-"
    case multiplikation = "*"
    case division =  "/"
    var id: String {
        self.rawValue
    }
}

enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard
    var id: String { self.rawValue }
}

enum Operation: String, CaseIterable, Identifiable {
    case addition, subtraction, multiplication, division
    var id: String { self.rawValue }
}

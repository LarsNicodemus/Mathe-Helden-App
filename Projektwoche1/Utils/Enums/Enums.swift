//
//  Enums.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

enum LeaderBoard: String,  Identifiable, CaseIterable, Codable {
    case monthly = "Monatlich"
    case yearly = "Jährlich"
    
    var id: String {
            self.rawValue
        }
}

//
//  QuizResult.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 06.11.24.
//
import SwiftUI
import SwiftData

@Model
class QuizResult {
    
    var correctAnswers: Int
    var incorrectAnswers: Int
    var date: Date

    init(correctAnswers: Int, incorrectAnswers: Int, date: Date = Date()) {
        self.correctAnswers = correctAnswers
        self.incorrectAnswers = incorrectAnswers
        self.date = date
    }
}

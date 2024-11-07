//
//  StoredQuizzes.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 07.11.24.
//

import SwiftUI
import SwiftData

@Model
class StoredQuizzes {
    var studentUUID: UUID
    var correctAnsweredQuestions: [String]
    var falseAnsweredQuestions: [String]
    var bonusQuestions: [String]
    init(studentUUID: UUID, correctAnsweredQuestions: [String] = [], falseAnsweredQuestions: [String] = [], bonusQuestions: [String] = []) {
        self.studentUUID = studentUUID
        self.correctAnsweredQuestions = correctAnsweredQuestions
        self.falseAnsweredQuestions = falseAnsweredQuestions
        self.bonusQuestions = bonusQuestions
    }
}

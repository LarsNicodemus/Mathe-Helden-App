//
//  LessonPlanView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 08.11.24.
//

import SwiftUI

struct LessonPlan: Hashable, Identifiable {
    let id = UUID()
    let subject: String
    let startTime: Date
    let endTime: Date
}

struct LessonPlanView: View {
    let lessonPlans: [String: [LessonPlan]] = [
        "Montag": [
            LessonPlan(subject: "Math", startTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 0))!, endTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 0))!),
            LessonPlan(subject: "Deutsch", startTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 15))!, endTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 15))!),
            LessonPlan(subject: "Kunst", startTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!),
            LessonPlan(subject: "Pause", startTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 0))!)
        ],
        "Dienstag": [
            LessonPlan(subject: "Sach", startTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 0))!, endTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 0))!),
            LessonPlan(subject: "Sport", startTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 15))!, endTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 15))!),
            LessonPlan(subject: "Musik", startTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!),
            LessonPlan(subject: "Pause", startTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 0))!)
        ],
        "Mittwoch": [ LessonPlan(subject: "Sach", startTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 0))!, endTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 0))!),
                      LessonPlan(subject: "Sport", startTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 15))!, endTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 15))!),
                      LessonPlan(subject: "Musik", startTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!),
                      LessonPlan(subject: "Pause", startTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 0))!)],
        "Donnerstag": [ LessonPlan(subject: "Sach", startTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 0))!, endTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 0))!),
                        LessonPlan(subject: "Sport", startTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 15))!, endTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 15))!),
                        LessonPlan(subject: "Musik", startTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!),
                        LessonPlan(subject: "Pause", startTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 0))!)],
        "Freitag": [ LessonPlan(subject: "Sach", startTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 0))!, endTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 0))!),
                     LessonPlan(subject: "Sport", startTime: Calendar.current.date(from: DateComponents(hour: 9, minute: 15))!, endTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 15))!),
                     LessonPlan(subject: "Musik", startTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!),
                     LessonPlan(subject: "Pause", startTime: Calendar.current.date(from: DateComponents(hour: 11, minute: 30))!, endTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 0))!)]
    ]

    var body: some View {
        Text("Stundenplan")
            .font(.largeTitle)
            .bold()
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"], id: \.self) { day in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack{
                            Text(day)
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(lessonPlans[day]!, id: \.self) { lesson in
                                LessonView(lesson: lesson)
                            }
                        }
                    }
                    
                }
            }
        }
        .padding()
    }
}

struct LessonView: View {
    let lesson: LessonPlan
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.subject)
                    .font(.body)
                    .fontWeight(.bold)
                Text(timeFormatter.string(from: lesson.startTime) + " - " + timeFormatter.string(from: lesson.endTime))
                    .font(.caption)
            }
            Spacer()
        }
        .frame(width: 100, height: 70)
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}

#Preview {
    VStack {
        LessonPlanView()
        
    }
}


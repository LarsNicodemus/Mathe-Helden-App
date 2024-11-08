//
//  ReportView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

struct ReportView: View {
    @AppStorage("Report") private var report: String = "Schreibe hier deinen Text"
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Fehler melden")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Bitte beschreibe deinen Fehler unten:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)

            UserInputFieldView(title: "Fehler Beschreibung", text: $report)
                .padding()

            Button(action: {
                if report.isEmpty || report == "Schreibe hier deinen Text" {
                    showAlert = true
                } else {
                    print("Report sent: \(report)")
                    report = ""
                }
            }) {
                Text("Fehler abschicken")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Bitte fülle die Fehlermeldung aus"), dismissButton: .default(Text("OK")))
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(20)
    }
}

#Preview {
    ReportView()
}

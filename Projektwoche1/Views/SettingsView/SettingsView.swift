//
//  SettingsView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 28.10.24.
//

import SwiftUI
import SwiftData
struct SettingsView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    
    @Binding var loggedIn: Bool
    @Binding var student: Student?
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .frame(height: 1)
                Form {
                    Section(header: Text("General")
                        .bold()
                        .foregroundStyle(.black)
                        .underline()
                        .font(.callout)
                    ) {
                        NavigationLink() {
                            AccountInformationView(student: $student)
                        } label: {
                            Label("Account Information", systemImage: "person.circle")
                        }
                        
                        
                        NavigationLink() {
                            ApperanceView()
                        } label: {
                            Label("Erscheinungsbild ", systemImage: "lightswitch.on")
                        }
                        
                        NavigationLink() {
                            AccessNotifiView()
                        } label: {
                            Label("Barrierefreiheit und Benachrichtigungen", systemImage: "switch.2")
                        }
                        
                        
                        
                    }
                    
                    Section(header: Text("Support")
                        .bold()
                        .foregroundStyle(.black)
                        .underline()
                        .font(.callout)
                    ) {
                        
                        NavigationLink() {
                            ReportView()
                        } label: {
                            Label("Fehlermeldung", systemImage: "exclamationmark.circle")
                        }
                        
                        NavigationLink() {
                            HStack {
                                ScrollView{
                                    FAQView()
                                        .padding()
                                }
                            }
                        } label: {
                            Label("FAQ", systemImage: "questionmark.circle")
                        }
                        
                    }
                    Section(header: Text("Dev-Settings")
                        .bold()
                        .foregroundStyle(.black)
                        .underline()
                        .font(.callout)
                    ) {
                        NavigationLink() {
                            DevSettingsView(student: $student)
                        } label: {
                            Label("Settings", systemImage: "qrcode")
                        }
                    }
                }
                Spacer()
                Button(action: {
                    loggedIn = false
                }) {
                    Text("Logout")
                        .bold()
                        .frame(width: 200)
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(30)
            }.background(Color(UIColor.systemGroupedBackground))
            // Um den hintergrund auszuschalten
            //.scrollContentBackground(.hidden)
        }
        
        
    }
}


#Preview {
    SettingsView(loggedIn: .constant(true), student: .constant(Student(username: "Student1", password: "password123", name: "Test 1")))
}

//
//  AccessNotifiView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

struct AccessNotifiView: View {
    @State private var notificationsEnabled = false
    @State private var selectedLanguage = "Deutsch"
    @State private var selectedFontSize = "Medium"
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Benachrichtigungen")) {
                        Toggle("Benachrichtigungen ein/aus", isOn: $notificationsEnabled)
                            .toggleStyle(SwitchToggleStyle())
                        
                        Button(action: {
                        }) {
                            Text("Welche Benachrichtigungen werden akzeptiert?")
                        }
                    }
                    
                    Section(header: Text("Sprache der App")) {
                        Picker("Sprache", selection: $selectedLanguage) {
                            Text("Deutsch").tag("Deutsch")
                            Text("Englisch").tag("Englisch")
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Section(header: Text("Schriftgröße")) {
                        Picker("Schriftgröße", selection: $selectedFontSize) {
                            Text("Klein").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Groß").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                .navigationTitle("Accessibility & Notifications")
                .navigationBarTitleDisplayMode(.inline)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Save")
                        .bold()
                        .frame(width: 200)
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

#Preview {
    AccessNotifiView()
}

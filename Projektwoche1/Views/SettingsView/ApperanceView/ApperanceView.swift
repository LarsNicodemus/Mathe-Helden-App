//
//  ApperanceView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

enum ThemeMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

struct ApperanceView: View {
    @AppStorage("selectedTheme") private var selectedTheme: ThemeMode = .system
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Appearance")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .font(.largeTitle)
                .padding()
            VStack{
                Text("Application theme")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                    .underline()
                    .font(.callout)
                    .padding()
                Text("Selecting a particular option will change the appereance(Color) of the Application")
                    .foregroundColor(.gray)
            }
            .padding()
            Spacer()
            HStack(spacing: 15) {
                ForEach(ThemeMode.allCases, id: \.self) { theme in
                    ThemeCard(theme: theme, isSelected: selectedTheme == theme)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedTheme = theme
                            }
                        }
                }
            }
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
    }
}

struct ThemeCard: View {
    let theme: ThemeMode
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme == .dark ? Color.black : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .frame(width: 100, height: 180)
                .overlay(
                    VStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 12)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 80, height: 40)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 40)
                    }
                )
            
            Text(theme.rawValue)
                .font(.callout)
                .foregroundColor(.primary)
            
            Circle()
                .fill(isSelected ? Color.black : Color.clear)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
        }
    }
}

#Preview {
    ApperanceView()
}

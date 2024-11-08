//
//  UserInputField.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

struct UserInputFieldView: View {
    var title: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(.gray)
                .underline()
            TextField(title, text: $text)
                .textFieldStyle(.plain)
                .padding(.bottom, 10)
                .overlay(
                    Divider()
                        .frame(maxHeight: 1)
                        .background(Color.black),
                    alignment: .bottom
                )
                .padding(.horizontal, 4)
        }
    }
}

#Preview {
    @Previewable @State var text: String = "hallo"
    UserInputFieldView(title: "hallo", text: $text)
}

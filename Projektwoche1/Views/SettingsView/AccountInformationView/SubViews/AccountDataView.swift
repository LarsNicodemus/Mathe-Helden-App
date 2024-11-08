//
//  AccountDataView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

struct AccountDataView: View {
    @Binding var email: String
    @Binding var password: String
    @State private var showPassword = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Benutzername / Emailadresse")
                .foregroundColor(.gray)
                .underline()
            TextField("Email address", text: $email)
                .textFieldStyle(.plain)
                .padding(.bottom, 10)
                .overlay(
                    Divider()
                        .frame(maxHeight: 1)
                        .background(
                            Color.black
                        ),
                    alignment: .bottom
                )
                .padding()
            
            
            Text("Password")
                .foregroundColor(.gray)
                .underline()
            HStack {
                if showPassword {
                    TextField("Password", text: $password)
                        .padding(.bottom, 5)
                        .overlay(alignment: .bottom) {
                            Rectangle().frame(height: 1)
                        }
                        .padding()
                } else {
                    SecureField("Password", text: $password)
                        .padding(.bottom, 5)
                        .overlay(alignment: .bottom) {
                            Rectangle().frame(height: 1)
                        }
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    AccountDataView(email: .constant("testmail"), password: .constant("password"))
}

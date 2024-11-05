//
//  CardView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        HStack {
            Text("01")
                .font(.largeTitle)
                .bold()
            Spacer()
            HStack{
                Image("cat")
                    .resizable()
                    .frame(width: 70, height: 70)
                Spacer().frame(width: 20)
                VStack(alignment: .leading) {
                    Text("Cat Name 1")
                    Divider()
                        .overlay(Color.black)
                        .padding(.trailing)
                    
                    HStack {
                        Label("100 pts", systemImage: "pesetasign.circle.fill")
                    }
                }
                Spacer()
                HStack {
                    Text("+1")
                    Image(systemName: "arrowtriangle.up.fill")
                }
                .padding(4)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray6))
            )
        }
        .background(Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CardView()
}

//
//  PlacePointsView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 07.11.24.
//

import SwiftUI

struct PlacePointsView: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerSize: CGSize(width: 70, height: 20))
                .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 370, height: 80)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(1), radius: 4, x: 0, y: 2)
                .overlay(
                    HStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 140, height: 70)
                            .padding()
                            .overlay(
                                VStack{
                                    Text("Du bist Platz")
                                        .bold()
                                    Text("1")
                                        .font(.largeTitle)
                                        .bold()
                                        .italic()
                                }
                            )
                        VStack(alignment: .leading) {
                            Text("Du besitzt:")
                                .font(.title3)
                                .bold()
                                
                            HStack {
                                Text("Punkteanzeige")
                                    .bold()
                                    .italic()
                                Image(systemName: "pesetasign.square")
                                    .font(.largeTitle)
                            }
                        }
                        
                    }
                )
        }
    }
}

#Preview {
    PlacePointsView()
}

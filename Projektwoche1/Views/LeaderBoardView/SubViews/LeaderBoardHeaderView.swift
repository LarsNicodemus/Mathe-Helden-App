//
//  LeaderBoardHeaderView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct LeaderBoardHeaderView: View {
    var body: some View {
        VStack {
            Text("Leader Board")
                .font(.largeTitle)
                .bold()
                .padding()
            HStack(alignment: .bottom, spacing: 20){
                VStack{
                    Image("cat")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Rectangle()
                        .frame(width: 65, height: 110)
                        .clipShape(.rect(topLeadingRadius: 20,
                                         topTrailingRadius: 20))
                }
                VStack{
                    HStack{
                        Image(systemName: "laurel.leading")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                            .offset(x: 8, y: 25)
                            .rotationEffect(Angle(degrees: -20))
                        Image("cat")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Image(systemName: "laurel.trailing")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                            .offset(x: -8, y: 25)
                            .rotationEffect(Angle(degrees: 20))
                    }
                    Rectangle()
                        .frame(width: 65, height: 150)
                        .clipShape(.rect(topLeadingRadius: 20,
                                         topTrailingRadius: 20))
                }
                VStack{
                    Image("cat")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Rectangle()
                        .frame(width: 65, height: 85)
                        .clipShape(
                            .rect(topLeadingRadius: 20,
                                  topTrailingRadius: 20)
                        )
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    LeaderBoardHeaderView()
}

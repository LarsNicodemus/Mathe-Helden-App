//
//  LeaderBoardView.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct LeaderBoardView: View {
    @State private var selectedTab: LeaderBoard = .monthly
    var body: some View {
        
        NavigationStack{
            VStack{
                Text("Leader Board")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding()
                Spacer()
                VStack{
                    HStack(alignment: .bottom){
                        VStack{
                            Image("cat")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Rectangle()
                                .frame(width: 65, height: 110)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        Spacer().frame(width: 20)
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
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        Spacer().frame(width: 20)
                        VStack{
                            Image("cat")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Rectangle()
                                .frame(width: 65, height: 85)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    
                    VStack{
                        Picker("Selected Tab", selection: $selectedTab) {
                            ForEach(LeaderBoard.allCases) { kiddoEntry in
                                                Text(kiddoEntry.rawValue).tag(kiddoEntry)

                                            }
                                        }
                                        .pickerStyle(.segmented)
                                        .padding()
                        CardView()
                        CardView()
                        CardView()
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .offset(y: -30)
                            .foregroundColor(.blue)
                            
                    )
                    
                }
                .overlay {
                    
                                }
                
               
            }
            
        }
    }
}

#Preview {
    LeaderBoardView()
}

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
                LeaderBoardHeaderView()

                Spacer()
                    .frame(maxWidth: .infinity)
                    .overlay {
                        VStack {
                            Picker("Selected Tab", selection: $selectedTab) {
                                ForEach(LeaderBoard.allCases) { kiddoEntry in
                                    Text(kiddoEntry.rawValue).tag(kiddoEntry)
                                    
                                }
                                
                            }
                            
                            .pickerStyle(.segmented)
                            
                            
                            .padding()
                            
                            List {
                                CardView()
                                    .listRowBackground(Color.clear)
                                CardView()
                                    .listRowBackground(Color.clear)
                                CardView()
                                    .listRowBackground(Color.clear)
                            }
                            .listStyle(.plain)
                            
                        }
                        .background(
                            Rectangle()
                                .fill(.blue)
                                .clipShape(
                                    .rect(topLeadingRadius: 20,
                                          topTrailingRadius: 20)
                                )
                        )
                    }
            }
        }
    }
}

#Preview {
    LeaderBoardView()
}

//
//  BottomNav.swift
//  Projektwoche1
//
//  Created by Lars Nicodemus on 05.11.24.
//

import SwiftUI

struct BottomNav: View {
    var body: some View {
        TabView{
            
            Tab("Rechnen",systemImage: "plus.forwardslash.minus"){
                RechnenView()
            }
            Tab("Leaderboard",systemImage: "medal"){
                LeaderBoardView()
            }
            Tab("Stundenplan",systemImage: "calendar"){
                
            }
            Tab("Einstellungen",systemImage: "gearshape.2"){
                
            }
        }
    }
}

#Preview {
    BottomNav()
//        .modelContainer(for: [])
}

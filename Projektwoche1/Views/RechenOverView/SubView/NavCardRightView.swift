//
//  NavCardRightView.swift
//  Projektwoche1
//
//  Created by Andreas Beer on 07.11.24.
//

import SwiftUI

struct NavCardRightView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(width: 70, height: 20))
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom))
                .frame(width: 190, height: 170)
                .shadow(color: Color.black.opacity(0.7), radius: 4, x: 0, y: 2)
                .overlay(
                    VStack {
                        Spacer()
                        Text("Wöchentliche")
                            .bold()
                        Text("Bonusaufgaben")
                            .bold()
                        Spacer()
                        Image("numberkids")
                            .resizable()
                            .frame(width: 150,height: 60)
                        Spacer()
                        HStack{
                            Image(systemName: "chevron.forward.dotted.chevron.forward")
                                .padding(-5)
                            Image(systemName: "chevron.forward.dotted.chevron.forward")
                                .padding(-5)
                        }
                        Spacer()
                    }
                )
        }
    }
}

#Preview {
    NavCardRightView()
}

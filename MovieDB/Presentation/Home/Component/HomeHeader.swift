//
//  HomeHeader.swift
//  MovieDB
//
//  Created by 60156720 on 12/12/25.
//

import SwiftUI

struct HomeHeader: View {
    private var openMenu: (() -> Void)
    
    init(openMenu: @escaping (() -> Void)) {
        self.openMenu = openMenu
    }
    
    var body: some View {
        HStack {
            Button {
                openMenu()
            } label: {
                Image(AppIcon.menu)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 32, height: 32)
                    .shadow(radius: 5, x: 5, y: 5)
            }
            Spacer()
            Text("Home")
                .bold()
                .foregroundColor(.white)
                .shadow(radius: 5, x: 5, y: 5)
            Spacer()
        }
    }
}

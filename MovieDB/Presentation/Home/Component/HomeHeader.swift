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
                    .frame(width: 32, height: 32)
            }
            Spacer()
            Text("Home")
            Spacer()
        }
    }
}

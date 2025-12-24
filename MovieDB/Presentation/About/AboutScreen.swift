//
//  AboutScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct AboutScreen: View {
    @Binding var showSlideMenu: Bool
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            Text(AppText.aboutMenu.localized())
                .font(.title)
        }
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
}


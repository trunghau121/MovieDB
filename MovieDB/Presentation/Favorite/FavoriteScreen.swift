//
//  FavoriteScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct FavoriteScreen: View {
    @Binding var showSlideMenu: Bool
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            Text(AppText.favoriteMenu.localized())
                .font(.title)
        }
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
}

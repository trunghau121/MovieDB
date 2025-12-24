//
//  SettingsScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct SettingsScreen: View {
    @Binding var showSlideMenu: Bool
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            Text(AppText.settingMenu.localized())
                .font(.title)
        }
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
}

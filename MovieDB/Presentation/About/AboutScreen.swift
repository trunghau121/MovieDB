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
        ZStack (alignment: .top) {
            Color.backgroundApp.ignoresSafeArea()
            ScrollView {
                Text(AppText.aboutApp.localized())
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.textApp)
                    .padding(.top, 10)
            }
            .applyPaddingStatusBar()
            .padding()
            .padding(.top, 40)
        }
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
}


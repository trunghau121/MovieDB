//
//  FeedbackScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct FeedbackScreen: View {
    @Binding var showSlideMenu: Bool
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Text(AppText.feedbackMenu.localized())
                .font(.title)
        }
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
}

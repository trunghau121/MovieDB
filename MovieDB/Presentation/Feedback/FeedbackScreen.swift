//
//  FeedbackScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct FeedbackScreen: View {
    var body: some View {
        ZStack {
            Text(AppText.feedbackMenu.localized())
                .font(.title)
        }
        .background(.backgroundApp)
    }
}

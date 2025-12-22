//
//  FavoriteScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct FavoriteScreen: View {
    var body: some View {
        ZStack {
            Text(AppText.favoriteMenu.localized())
                .font(.title)
        }
        .background(.backgroundApp)
        .ignoresSafeArea()
    }
}

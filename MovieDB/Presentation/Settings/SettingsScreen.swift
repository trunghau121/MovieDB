//
//  SettingsScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        ZStack {
            Text(AppText.settingMenu.localized())
                .font(.title)
        }
        .background(.backgroundApp)
    }
}

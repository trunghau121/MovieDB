//
//  AboutScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        ZStack {
            Text(AppText.aboutMenu.localized())
                .font(.title)
        }
        .background(.backgroundApp)
    }
}


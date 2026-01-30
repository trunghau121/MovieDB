//
//  EmptyView.swift
//  MovieDB
//
//  Created by 60156720 on 12/25/25.
//

import SwiftUI

struct AppEmptyView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Spacer()
                Image(systemName: "exclamationmark.circle").font(.system(size: 60))
                Text(AppText.noDataMovie.localized())
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AppEmptyView()
}

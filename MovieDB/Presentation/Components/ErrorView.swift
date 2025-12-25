//
//  ErrorView.swift
//  MovieDB
//
//  Created by 60156720 on 12/25/25.
//

import SwiftUI

struct ErrorView: View {
    var message: String
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Spacer()
            Image(systemName: "exclamationmark.triangle").font(.system(size: 48))
            Text(message)
            Spacer()
        }
    }
}

#Preview {
    ErrorView(message: "exclamationmark")
}

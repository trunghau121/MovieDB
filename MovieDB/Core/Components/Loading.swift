//
//  Loading.swift
//  MovieDB
//
//  Created by 60156720 on 10/29/25.
//

import SwiftUICore
import SwiftUI

struct Loading: View {
    var text: String
    init(text: String = "Loading...") {
        self.text = text
    }
    
    var body: some View {
        ZStack {
            ProgressView(text)
                .tint(Color.white)
                .foregroundStyle(.white)
        }
        .padding(20)
        .background(Color.vulcan.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .disabled(true)
    }
}

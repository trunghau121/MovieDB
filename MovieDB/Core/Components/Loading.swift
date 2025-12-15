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
        if #available(iOS 16.0, *) {
            ProgressView(text)
                .tint(Color.black)
                .foregroundStyle(.black)
        } else {
            ProgressView(text)
                .accentColor(Color.black)
                .foregroundColor(.black)
        }
    }
}

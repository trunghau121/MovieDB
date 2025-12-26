//
//  DetailHeader.swift
//  MovieDB
//
//  Created by 60156720 on 12/25/25.
//

import SwiftUI

struct DetailHeader: View {
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    var isFavorius: Bool
    var onBack: (() -> Void)
    var onFavorius: (() -> Void)
    
    var body: some View {
        HStack {
            Button {
                onBack()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .font(.title2)
                    .shadow(radius: 5, x: 5, y: 5)
            }
            Spacer()
            Button {
                onFavorius()
            } label: {
                Image(systemName: isFavorius ? "heart.fill" : "heart")
                    .foregroundColor(isFavorius ? .red : .white)
                    .font(.title2)
                    .shadow(radius: 5, x: 5, y: 5)
            }
        }
        .applyPaddingStatusBar()
        .padding()
        .frame(width: containerWidth)
    }
}

#Preview {
    DetailHeader(isFavorius: true, onBack: {}, onFavorius: {})
}

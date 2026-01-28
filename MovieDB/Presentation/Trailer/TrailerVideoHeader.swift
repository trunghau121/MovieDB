//
//  TrailerVideoHeader.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

import SwiftUI

struct TrailerVideoHeader: View {
    var title: String
    var onBack: () -> ()
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            Button {
                onBack()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.iconApp)
                    .font(.title2)
                    .padding(7)
                    .padding(.leading, 7)
            }
            
            Text("Trailer: \(title)")
                .foregroundColor(.textApp)
                .font(.system(size: 18).bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 14)
        }
        .padding(.top, 15)
        .frame(width: containerWidth)
    }
}

#Preview {
    TrailerVideoHeader(title: "Cosmic Princess Kaguya, Cosmic Princess Kaguya!",onBack: {})
}

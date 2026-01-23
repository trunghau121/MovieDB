//
//  VotesView.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import SwiftUI

struct VotesView: View {
    struct ClipShape: Shape {
        let width: Double
        
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }
    
    let rating: Double
    let maxRating: Int = 5
    
    init(rating: Double) {
        self.rating = rating / 2
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star"))
                    .foregroundColor(.yellow)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(maxRating)) * CGFloat(rating))
                )
            }
        )
    }
}

struct VotesView_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            VotesView(rating: 7.046)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

//
//  BackdropMovie.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//

import SwiftUI

struct BackdropMovie: View {
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    var movie: Movie
    
    var body: some View {
        AsyncImageApp(url: movie.backdropPath)
        .background(Color.gray)
        .blur(radius: 20)
        .clipShape(RoundedCornersShape(radius: 15,  conners: [.bottomLeft, .bottomRight]))
        .frame(width: containerWidth)
    }
}

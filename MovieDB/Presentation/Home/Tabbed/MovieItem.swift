//
//  MovieItem.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct MovieItem: View {
    private let width = UIScreen.main.bounds.width / 2.4
    @State private var textHeight: CGFloat = 0
    var movie: Movie
    var height: CGFloat
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImageApp(url: movie.posterPath)
                .frame(width: width, height: height - textHeight - 30)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .slideMenu.opacity(0.2), radius: 5, x: 2, y: 0)
            
            Text(movie.title)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)
                .foregroundColor(.textApp)
                .padding(.bottom, 20)
                .background(
                    GeometryReader { proxy in
                        Color.clear.onAppear {
                            textHeight = proxy.size.height
                        }
                    }
                )
        }
        .frame(width: width, height: height)
    }
}

let movieMockup = Movie(
    id: 0,
    title: "Springsteen: Deliver Me from Nowhere",
    backdropPath: "/7OwZxXuLPtCFjdqJdiTuEE1DE4J.jpg",
    posterPath: "/csBV3eq4RDjNg1acNQ8kwOZyPlZ.jpg",
    voteAverage: 7.0,
    releaseDate: "2025-10-22",
    overview: "Bruce Springsteen, a young musician on the cusp of global superstardom, struggles to reconcile the pressures of success with the ghosts of his past."
)

#Preview {
    MovieItem(movie: movieMockup, height: 300)
}

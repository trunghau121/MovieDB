//
//  MovieTabView.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct MovieTabView: View {
    var namespaceId: Namespace.ID
    var movies: [Movie]
    var moveToDetail: ((Movie) -> Void)
    
    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { scroll in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(movies) { movie in
                            Button {
                                moveToDetail(movie)
                            } label: {
                                MovieItem(namespaceId: namespaceId, movie: movie, height: proxy.size.height)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

struct MovieTabView_Previews: PreviewProvider {
    struct ContainerView: View {
        @Namespace var namespaceId
        let movieMockup = Movie(
            id: 0,
            title: "Springsteen: Deliver Me from Nowhere",
            backdropPath: "/7OwZxXuLPtCFjdqJdiTuEE1DE4J.jpg",
            posterPath: "/csBV3eq4RDjNg1acNQ8kwOZyPlZ.jpg",
            voteAverage: 7.0,
            releaseDate: "2025-10-22",
            overview: "Bruce Springsteen, a young musician on the cusp of global superstardom, struggles to reconcile the pressures of success with the ghosts of his past."
        )
        var body: some View {
            MovieTabView(namespaceId: namespaceId, movies: [movieMockup, movieMockup, movieMockup, movieMockup]) { movieId in
                
            }
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

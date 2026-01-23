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
        var body: some View {
            MovieTabView(namespaceId: namespaceId, movies: Movie.placeholder) { movieId in
                
            }
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

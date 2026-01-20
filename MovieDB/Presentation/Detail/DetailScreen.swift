//
//  DetailScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation
import SwiftUI

struct DetailScreen: View {
    private let containerHeight: CGFloat = UIScreen.main.bounds.height
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    @StateObject var viewModel = DetailViewModel()
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    @ObservedObject var movieManager: MovieManager = .shared
    @State var isFavorite: Bool = false
    @Binding var movie: Movie?
    var namespaceId: Namespace.ID
    
    var body: some View {
        if let movie = movie {
            ZStack {
                Color.backgroundApp.ignoresSafeArea()
                
                VStack {
                    ZStack (alignment: .topLeading) {
                        AsyncImageApp(url: movie.backdropPath)
                            .background(Color.gray)
                            .frame(width: containerWidth, height: containerHeight * 0.35)
                            .clipShape(RoundedCornersShape(radius: 15,  conners: [.bottomLeft, .bottomRight]))
                            .matchedGeometryEffect(id: movie.id, in: namespaceId)
                        
                        AsyncImageApp(url: movie.posterPath)
                            .background(Color.gray)
                            .frame(width: containerHeight * 0.15, height: containerHeight * 0.2)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                            .padding(.top, (containerHeight * 0.35) - (containerHeight * 0.2) / 2)
                            .padding(.horizontal, 15)
                        
                        Text(movie.title)
                            .font(.system(size: 17).bold())
                            .foregroundColor(.textApp)
                            .padding(.top, (containerHeight * 0.35) + 5)
                            .padding(.leading, (containerHeight * 0.15) + 20)
                            .padding(.trailing, 10)
                            .matchedGeometryEffect(id: "title \(movie.id)", in: namespaceId, properties: .position)
                    }
                    
                    Spacer()
                }
                .overlay(
                    DetailHeader(
                        isFavorius: isFavorite,
                        onBack: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                                self.movie = nil
                            }
                        },
                        onFavorius: {
                            if case .loaded(let movie) = viewModel.state {
                                let isFavorite = movieManager.isFavorite(movieId: movie.id)
                                if isFavorite {
                                    movieManager.remove(movie: movie)
                                } else {
                                    movieManager.save(movie: movie)
                                }
                                self.isFavorite = !isFavorite
                            }
                        }
                    ),
                    alignment: .top
                )
                .ignoresSafeArea()
                .onAppear {
                    isFavorite = movieManager.isFavorite(movieId: movie.id)
                    viewModel.getMovieDetail(movieId: movie.id)
                }
                .statusBarHidden(true)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    struct ContainerView: View {
        @State var movie: Movie? = Movie.placeholder.first
        @Namespace var namespaceId
        
        var body: some View {
            DetailScreen(movie: $movie, namespaceId: namespaceId)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

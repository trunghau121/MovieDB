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
    private let movieId: Int
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    @ObservedObject var movieManager: MovieManager = .shared
    @State var isFavorite: Bool = false
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var body: some View {
        ZStack {
            Color.backgroundApp.ignoresSafeArea()
            
            CollectionLoadingView(loadingState: viewModel.state) { movie in
                VStack {
                    ZStack (alignment: .topLeading) {
                        AsyncImageApp(url: movie.backdropPath)
                            .background(Color.gray)
                            .frame(width: containerWidth, height: containerHeight * 0.35)
                            .clipShape(RoundedCornersShape(radius: 15,  conners: [.bottomLeft, .bottomRight]))
                        
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
                    }
                    
                    Spacer()
                }
            } empty: {
                Rectangle()
                    .fill(Color.orange)
            } error: { error in
                Rectangle()
                    .fill(Color.red)
            }
        }
        .overlay(
            DetailHeader(
                isFavorius: isFavorite,
                onBack: {
                    coordinator.pop()
                },
                onFavorius: {
                    if case .loaded(let movie) = viewModel.state {
                        let isFavorite = movieManager.isFavorite(movieId: movieId)
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
            isFavorite = movieManager.isFavorite(movieId: movieId)
            viewModel.getMovieDetail(movieId: movieId)
        }
        .statusBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            DetailScreen(movieId: 12345678)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

//
//  ContentView.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import SwiftUI

struct HomeScreen: View {
    private let containerHeight: CGFloat = UIScreen.main.bounds.height
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    @State var movieScrollVisible: Movie? = nil
    @Binding var movie: Movie?
    @Binding var showSlideMenu: Bool
    @Namespace var namespaceId
    @Namespace var namespaceIdCarousel
    @State var activateNamespace: Namespace.ID? = nil
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if let movie = movieScrollVisible {
                BackdropMovie(movie: movie)
                    .frame(height: containerHeight * 0.45)
            }
            // Content
            content
            // Loading
            if viewModel.isLoading {
                Loading()
            }
        }
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
    
    @ViewBuilder
    var content: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: containerHeight *  0.16)
                
                CollectionLoadingView(loadingState: viewModel.trendingState) { movies in
                    CarouselMovie(namespaceId: namespaceIdCarousel, movies: movies, movieScrollVisible: $movieScrollVisible) { movie in
                        if movie.id > 0 {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                                activateNamespace = namespaceIdCarousel
                                self.movie = movie
                            }
                        }
                    }
                } empty: {
                    ZStack {
                        AppEmptyView()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: containerHeight *  0.40)
                    .background(Color.red)
                    .clipShape(RoundedCornersShape(radius: 15))
                } error: { error in
                    ZStack {
                        ErrorView(message: error.getErrorMessage())
                    }
                    .frame(width: UIScreen.main.bounds.width, height: containerHeight *  0.40)
                    .background(Color.red)
                    .clipShape(RoundedCornersShape(radius: 15))
                }
                .onAppear {
                    viewModel.loadTrending()
                }
                
                MovieTabbed(namespaceId: namespaceId, viewModel: viewModel) { movie in
                    if movie.id > 0 {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                            activateNamespace = namespaceId
                            self.movie = movie
                        }
                    }
                }
            }.onReceive(viewModel.$trendingState) { state in
                if case let .loaded(movies) = state {
                    movieScrollVisible = movies.first
                } else if case let .loading(placeholder) = state {
                    movieScrollVisible = placeholder.first
                }
            }
            
            if movie != nil, let namespace = activateNamespace {
                DetailScreen(movie: $movie, namespaceId: namespace)
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        @State var showSlideMenu: Bool = false
        @State var movie: Movie? = nil
        var body: some View {
            HomeScreen(movie: $movie, showSlideMenu: $showSlideMenu)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

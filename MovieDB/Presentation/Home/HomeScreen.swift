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
    @EnvironmentObject var router: NavigationRouter
    @State var movieScrollVisible: Movie? = nil
    @Binding var showSlideMenu: Bool
    
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
        .onReceive(viewModel.navigation) { event in
            handleNavigation(event)
        }
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: containerHeight *  0.16)
            
            CollectionLoadingView(loadingState: viewModel.trendingState) { movies in
                CarouselMovie(movies: movies, movieScrollVisible: $movieScrollVisible) { movieId in
                    viewModel.didSelect(movieId)
                }
            } empty: {
                ZStack {
                    AppEmptyView()
                }
                .frame(width: UIScreen.main.bounds.width, height: containerHeight *  0.40)
                .background(.red)
                .clipShape(RoundedCornersShape(radius: 15))
            } error: { error in
                ZStack {
                    ErrorView(message: error.getErrorMessage())
                }
                .frame(width: UIScreen.main.bounds.width, height: containerHeight *  0.40)
                .background(.red)
                .clipShape(RoundedCornersShape(radius: 15))
            }
            .onAppear {
                viewModel.loadTrending()
            }

            MovieTabbed(viewModel: viewModel) { movieId in
                viewModel.didSelect(movieId)
            }
        }.onReceive(viewModel.$trendingState) { state in
            if case let .loaded(movies) = state {
                movieScrollVisible = movies.first
            } else if case let .loading(placeholder) = state {
                movieScrollVisible = placeholder.first
            }
        }
    }
    
    
    private func handleNavigation(_ event: HomeNavigationEvent) {
        switch event {
        case .openDetail(let movieId):
            // Move to Detail screen
            router.push(MovieDBRoute.detail(movieId: movieId))
            break
        }
    }
}


//struct HomeScreen_Previews: PreviewProvider {
//    struct ContainerView: View {
//        @State var showSlideMenu: Bool = false
//        var body: some View {
//            HomeScreen(showSlideMenu: $showSlideMenu)
//        }
//    }
//    
//    static var previews: some View {
//        ContainerView()
//    }
//}

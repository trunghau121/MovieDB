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
        .onAppear {
            viewModel.loadTrending()
            viewModel.loadMovieWithTab(tab: .popular)
        }
        .onReceive(viewModel.navigation) { event in
            handleNavigation(event)
        }
        .toast(item: $viewModel.toast) { toast in
            Text(toast.message).padding()
        }
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: containerHeight *  0.14)
            
            CarouselMovie(movies: viewModel.trending, movieScrollVisible: $movieScrollVisible) { movieId in
                viewModel.didSelect(movieId)
            }
            
            MovieTabbed(homeViewModel: viewModel)
        }.onReceive(viewModel.$trending) { movies in
            movieScrollVisible = movies.first
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


struct HomeScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        @State var showSlideMenu: Bool = false
        var body: some View {
            HomeScreen(showSlideMenu: $showSlideMenu)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

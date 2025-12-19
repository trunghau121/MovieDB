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
    @State var presentSlideMenu = false
    @State var selectedSlideMenu = -1
    @State var movieScrollVisible: Movie? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            if let movie = movieScrollVisible {
                BackdropMovie(movie: movie)
                    .ignoresSafeArea()
                    .frame(height: containerHeight * 0.40)
            }
            
            VStack {
                // Header
                HomeHeader {
                    presentSlideMenu.toggle()
                }
                .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: containerHeight *  0.08)
                
                // Content
                content
            }
            
            // Slide Menu
            SlideMenu(
                isShowing: $presentSlideMenu,
                content: AnyView(SlideMenuView(selectedTabMenu: $selectedSlideMenu, presentSlideMenu: $presentSlideMenu))
            )
            
            // Loading
            if viewModel.isLoading {
                Loading()
            }
        }
        .onAppear {
            viewModel.loadTrending()
        }
        .onReceive(viewModel.navigation) { event in
            handleNavigation(event)
        }
        .toast(item: $viewModel.toast) { toast in
            Text(toast.message).padding()
        }
        .background(Color.vulcan)
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading) {
            CarouselMovie(movies: viewModel.trending, movieScrollVisible: $movieScrollVisible) { movieId in
                viewModel.didSelect(movieId)
            }
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


#Preview {
    HomeScreen()
}

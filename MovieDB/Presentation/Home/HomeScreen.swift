//
//  ContentView.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var router: NavigationRouter
    @State var presentSlideMenu = false
    @State var selectedSlideMenu = -1
    
    var body: some View {
        ZStack {
            VStack {
                // Header
                HomeHeader {
                    presentSlideMenu.toggle()
                }
                .padding(.horizontal, 24)
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
    }
    
    @ViewBuilder
    var content: some View {
        let containerWidth: CGFloat = UIScreen.main.bounds.width - 32.0
        List(viewModel.trending, id: \.id) { movie in
            HStack {
                RemoteImageApp(
                    url: movie.backdropPath,
                    size: .init(
                        width: containerWidth * 0.35,
                        height: containerWidth * 0.35
                    )
                )
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack(alignment: .leading) {
                    Text(movie.title).font(.title2)
                    Text(movie.overview)
                        .lineLimit(2)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                }
                .frame(width: containerWidth * 0.60)
            }
            .onTapGesture {
                viewModel.didSelect(movie.id)
            }
        }
    }
    
    
    private func handleNavigation(_ event: HomeNavigationEvent) {
        switch event {
        case .openDetail(let movieId):
            // Move to Detail screen
            router.push(DetailScreen(movieId: movieId))
            break
        }
    }
}


#Preview {
    HomeScreen()
}

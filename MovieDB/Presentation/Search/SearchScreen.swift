//
//  SearchTestScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/29/25.
//

import SwiftUI

struct SearchScreen: View {
    private let containerHeight: CGFloat = UIScreen.main.bounds.height
    @StateObject var viewModel = SearchViewModel()
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            SearchHeader(text: $viewModel.query) {
                router.pop()
            }
            CollectionLoadingView(
                loadingState: viewModel.state,
                content: { movies in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(movies, id: \.id) { movie in
                                ItemSearch(movie: movie)
                                    .onTapGesture {
                                        viewModel.didSelect(movie.id)
                                    }
                            }
                        }
                    }
                },
                empty: {
                    ZStack {
                        AppEmptyView()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: containerHeight *  0.20)
                },
                error: { error in
                    ZStack {
                        ErrorView(message: error.getErrorMessage())
                    }
                    .frame(width: UIScreen.main.bounds.width, height: containerHeight *  0.20)
                }
            )
            .frame(maxHeight: .infinity)
        }
        .applyPaddingStatusBar()
        .ignoresSafeArea()
        .background(.backgroundApp)
        .statusBarHidden(true)
        .onReceive(viewModel.navigation) { event in
            handleNavigation(event)
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

struct SearchScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            SearchScreen()
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

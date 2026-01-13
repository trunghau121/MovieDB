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
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    
    var body: some View {
        VStack {
            SearchHeader(text: $viewModel.query) {
                coordinator.pop()
            }
            CollectionLoadingView(
                loadingState: viewModel.state,
                content: { movies in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(movies, id: \.id) { movie in
                                ItemSearch(movie: movie)
                                    .onTapGesture {
                                        coordinator.show(.detail(movieId: movie.id))
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
        .background(Color.backgroundApp)
        .ignoresSafeArea()
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

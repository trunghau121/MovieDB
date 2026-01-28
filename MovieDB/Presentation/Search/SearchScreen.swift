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
    @State var movie: Movie? = nil
    @Namespace var namespaceId
    
    var body: some View {
        ZStack {
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
                                    ItemSearch(namespaceId: namespaceId, movie: movie)
                                        .onTapGesture {
                                            if movie.id > 0 {
                                                withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                                                    hideKeyboard()
                                                    self.movie = movie
                                                }
                                            }
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
            
            if movie != nil {
                DetailScreen(movie: $movie, namespaceId: namespaceId)
            }
        }
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

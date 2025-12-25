//
//  MovieTabbed.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct MovieTabbed: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        WithTabBar { selection in
            CollectionLoadingView(loadingState: viewModel.movieTabState) { movies in
                MovieTabView(movies: movies)
            } empty: {
                AppEmptyView()
            } error: { error in
                ErrorView(message: error.getErrorMessage())
            }
            .onChange(of: selection) { value in
                viewModel.movieTabState = .loading(placeholder: Movie.placeholder)
                viewModel.loadMovieWithTab(tab: value)
            }
            .onAppear {
                viewModel.loadMovieWithTab(tab: .popular)
            }
        }
    }
}

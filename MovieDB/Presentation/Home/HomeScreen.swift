//
//  ContentView.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import SwiftUI
import Kingfisher

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            // Content
            content
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
        .padding()
    }
    
    @ViewBuilder
    var content: some View {
        List(viewModel.trending, id: \.id) { movie in
            HStack {
                RemoteImageApp(
                    url: movie.backdropPath,
                    size: .init(width: 200, height: 200)
                )
                VStack(alignment: .leading) {
                    Text(movie.title).font(.title)
                    Text(movie.overview)
                }
            }
            .onTapGesture {
                viewModel.didSelect(movie.id)
            }
        }
    }
    
    
    private func handleNavigation(_ event: NaviagionEvent) {
        switch event {
        case .openDetail(let movieId):
            // Move screen
            break
        }
    }
}

#Preview {
    HomeScreen()
}

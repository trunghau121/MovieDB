//
//  TrailerVideoScreen.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

import SwiftUI
import YouTubePlayerKit

struct TrailerVideoScreen: View {
    @StateObject var viewModel = TrailerVideoViewModel()
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    var movie: Movie?
    @State var trailerSelected: Trailer? = nil
    @StateObject var youTubePlayer: YouTubePlayer = ""
    
    var body: some View {
        VStack {
            TrailerVideoHeader(title: movie?.title ?? "") {
                coordinator.dismiss()
            }
            
            YouTubePlayerView(youTubePlayer) { state in
                switch state {
                case .idle:
                    ProgressView()
                case .ready:
                    EmptyView()
                case .error(let error):
                    ZStack {
                        ErrorView(message: error.getErrorMessage())
                    }
                    .background(Color.red)
                    .clipShape(RoundedCornersShape(radius: 15))
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            
            CollectionLoadingView(loadingState: viewModel.state) { videos in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(videos, id: \.id) { item in
                            TrailerVideoItem(trailer: item, isSelected: item.id == trailerSelected?.id)
                                .onTapGesture {
                                    if case .loaded(_) = self.viewModel.state {
                                        if item.id != trailerSelected?.id {
                                            withAnimation {
                                                trailerSelected = item
                                                playVideo()
                                            }
                                        }
                                    }
                                }
                            
                            if item != videos.last {
                                Divider()
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
            } empty: {
                AppEmptyView()
            } error: { error in
                ErrorView(message: error.getErrorMessage())
            }
        }
        .background(Color.backgroundApp)
        .ignoresSafeArea()
        .onReceive(viewModel.$state) { state in
            if case .loaded(let videos) = state {
                withAnimation {
                    self.trailerSelected = videos[0]
                    playVideo()
                }
            }
        }
        .onAppear {
            viewModel.getTrailerVideos(movieId: movie?.id ?? 0)
        }
    }
    
    private func playVideo() {
        Task {
            try await youTubePlayer.load(source: .video(id: "\(trailerSelected?.key ?? "")"))
        }
    }
}

struct TrailerVideoScreen_Previews : PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            TrailerVideoScreen(movie: Movie.placeholder[0])
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}


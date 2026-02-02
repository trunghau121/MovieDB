//
//  DetailScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation
import SwiftUI

struct DetailScreen: View {
    private let containerHeight: CGFloat = UIScreen.main.bounds.height
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    @StateObject var viewModel = DetailViewModel()
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    @ObservedObject var movieManager: MovieManager = .shared
    @State var isFavorite: Bool = false
    @Binding var movie: Movie?
    var namespaceId: Namespace.ID
    
    var body: some View {
        if let movie = movie {
            ZStack {
                Color.backgroundApp.ignoresSafeArea()
                ScrollView {
                    VStack {
                        ZStack (alignment: .topLeading) {
                            ZStack {
                                AsyncImageApp(url: movie.backdropPath)
                                    .background(Color.gray)
                                    .frame(width: containerWidth, height: containerHeight * 0.35)
                                    .clipShape(RoundedCornersShape(radius: 15,  conners: [.bottomLeft, .bottomRight]))
                                    .matchedGeometryEffect(id: movie.id, in: namespaceId)
                                
                                Button {
                                    coordinator.show(MapRouter.trailer(movie: movie))
                                } label: {
                                    Image(AppIcon.iconPlay)
                                        .scaledToFit()
                                        .frame(width: 10, height: 10)
                                }
                            }
                            
                            AsyncImageApp(url: movie.posterPath)
                                .background(Color.gray)
                                .frame(width: containerHeight * 0.15, height: containerHeight * 0.2)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                                .padding(.top, (containerHeight * 0.35) - (containerHeight * 0.2) / 2)
                                .padding(.horizontal, 15)
                            
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .font(.system(size: 17).bold())
                                    .foregroundColor(.textApp)
                                    .matchedGeometryEffect(id: "title \(movie.id)", in: namespaceId, properties: .position)
                                VotesView(rating: movie.voteAverage)
                            }
                            .padding(.top, (containerHeight * 0.35) + 10)
                            .padding(.leading, (containerHeight * 0.15) + 20)
                            .padding(.trailing, 10)
                        }
                        
                        
                        HStack(alignment: .center) {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                            Text(movie.releaseDate)
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                            
                            Capsule()
                                .fill(.gray)
                                .frame(width: 2, height: 18)
                            
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                            Text("\(movie.runtime) \(AppText.minutes.localized())")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 15)
                        .padding(.horizontal, 15)
                        
                        CollectionLoadingView(loadingState: viewModel.state) { movie in
                            TagListView(data: movie.genres)
                                .onReceive(viewModel.$state) { state in
                                    if case .loaded(let movie) = viewModel.state {
                                        self.movie = movie
                                    }
                                }
                        } empty: {
                            AppEmptyView()
                        } error: { error in
                            ErrorView(message: error.getErrorMessage())
                        }
                        
                        ExpandableText(movie.overview, lineLimit: 3, font: UIFont.systemFont(ofSize: 15))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                        
                        Button {
                            if case .loaded(let photos) = viewModel.photoState {
                                coordinator.show(MapRouter.photo(data: photos, photoSelected: photos[0]))
                            }
                        } label: {
                            Text("Screenshots")
                                .font(.system(size: 16).bold())
                                .foregroundColor(Color.textApp)
                                .padding(.horizontal, 15)
                                .padding(.top, 10)
                                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        }
                        
                        CollectionLoadingView(loadingState: viewModel.photoState) { photos in
                            ScreenshotListView(data: photos) { photo in
                                if case .loaded(let photos) = viewModel.photoState {
                                    coordinator.show(MapRouter.photo(data: photos, photoSelected: photo))
                                }
                            }
                        } empty: {
                            AppEmptyView()
                        } error: { error in
                            ErrorView(message: error.getErrorMessage())
                        }
                        
                        Text(AppText.casts.localized())
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color.textApp)
                            .padding(.horizontal, 15)
                            .padding(.top, 10)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        CollectionLoadingView(loadingState: viewModel.castState) { casts in
                            CastListView(data: casts) { cast in
                                if case .loaded(_) = viewModel.castState {
                                    coordinator.show(MapRouter.cast(data: cast))
                                }
                            }
                        } empty: {
                            AppEmptyView()
                        } error: { error in
                            ErrorView(message: error.getErrorMessage())
                        }
                        
                        Spacer()
                    }
                    .ignoresSafeArea()
                    .onAppear {
                        isFavorite = movieManager.isFavorite(movieId: movie.id)
                        viewModel.getMovieDetail(movieId: movie.id)
                        viewModel.getPhotos(movieId: movie.id)
                        viewModel.getCastCrew(movieId: movie.id)
                    }
                    .statusBarHidden(true)
                }
            }
            .overlay(
                DetailHeader(
                    isFavorius: isFavorite,
                    onBack: {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                            self.movie = nil
                        }
                    },
                    onFavorius: {
                        if case .loaded(let movie) = viewModel.state {
                            let isFavorite = movieManager.isFavorite(movieId: movie.id)
                            if isFavorite {
                                movieManager.remove(movie: movie)
                            } else {
                                movieManager.save(movie: movie)
                            }
                            self.isFavorite = !isFavorite
                        }
                    }
                ),
                alignment: .top
            )
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    struct ContainerView: View {
        @State var movie: Movie? = Movie.placeholder.first
        @Namespace var namespaceId
        
        var body: some View {
            DetailScreen(movie: $movie, namespaceId: namespaceId)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

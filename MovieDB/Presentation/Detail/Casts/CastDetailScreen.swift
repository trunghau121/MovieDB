//
//  CastDetailScreen.swift
//  MovieDB
//
//  Created by 60156720 on 1/30/26.
//

import SwiftUI
import Kingfisher

struct CastDetailScreen: View {
    @StateObject var viewModel = DetailViewModel()
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    private let containerHeight: CGFloat = UIScreen.main.bounds.height
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    var cast: Cast
    @State var castState: Cast? = nil
    @Namespace var namespaceId
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImageApp(url: castState?.profilePath ?? cast.profilePath)
                .background(Color.gray)
                .frame(width: containerWidth, height: containerHeight)
                .blur(radius: 100)
            
            Color.black.opacity(0.2).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    AsyncImageApp(url: castState?.profilePath ?? cast.profilePath)
                        .background(Color.gray)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.violet, lineWidth: 2)
                        )
                    
                    Text(castState?.name ?? cast.name)
                        .font(.system(size: 17).bold())
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    CollectionLoadingView(loadingState: viewModel.castDetailState) { castDetail in
                        VStack {
                            if !castDetail.birthday.isEmpty {
                                HStack(alignment: .center) {
                                    Image(systemName: "calendar")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                    
                                    Text(castDetail.birthday)
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            if !castDetail.placeOfBirth.isEmpty {
                                HStack(alignment: .center) {
                                    Image(systemName: "house")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                    
                                    Text(castDetail.placeOfBirth)
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            ExpandableText(castDetail.biography, lineLimit: 6, font: UIFont.systemFont(ofSize: 15))
                                .foregroundColor(.white)
                                .padding(.top, 10)
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                    } empty: {
                        AppEmptyView()
                    } error: { error in
                        ErrorView(message: error.getErrorMessage())
                    }
                    
                    Text(AppText.movies.localized())
                        .font(.system(size: 16).bold())
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                    CollectionLoadingView(loadingState: viewModel.castMovieListState) { movies in
                        MovieTabView(namespaceId: namespaceId, movies: movies, textColor: .white) { movie in }
                    } empty: {
                        AppEmptyView()
                    } error: { error in
                        ErrorView(message: error.getErrorMessage())
                    }
                    .frame(height: containerHeight * 0.35)
                    
                    Spacer()
                }
                .padding(.top, containerHeight * 0.12)
                .frame(maxWidth: .infinity)
            }
            
            Button {
                coordinator.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .shadow(radius: 7, x: 7, y: 7)
                    .padding(5)
            }
            .padding(.leading)
            .applyPaddingStatusBar()
            .padding(.top, 10)
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.getCastDetail(personId: cast.id)
            viewModel.getCastMovies(personId: cast.id)
        }
        .onReceive(viewModel.$castDetailState) { state in
            if case .loaded(let cast) = state {
                castState = cast
            }
        }
    }
}

struct CastDetailScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            CastDetailScreen(cast: Cast.placeholder[0])
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

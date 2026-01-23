//
//  FavoriteScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct FavoriteScreen: View {
    @Binding var showSlideMenu: Bool
    @ObservedObject var movieManager = MovieManager.shared
    @EnvironmentObject var coondinator: Coordinator<MapRouter>
    private let width = ((UIScreen.main.bounds.width) - 50) / 2
    @Binding var movie: Movie?
    @Namespace var namespaceId
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.movieManager.movies, id: \.id) { movie in
                        ZStack (alignment: .topTrailing) {
                            VStack {
                                AsyncImageApp(url: movie.posterPath)
                                    .frame(width: width, height: width * 1.5)
                                    .background(Color.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                                    .matchedGeometryEffect(id: movie.id, in: namespaceId)
                                
                                
                                Text(movie.title)
                                    .font(.system(size: 14, weight: .semibold))
                                    .lineLimit(1)
                                    .foregroundColor(.textApp)
                                    .matchedGeometryEffect(id: "title \(movie.id)", in: namespaceId, properties: .position)
                            }
                            
                            Button {
                                self.movieManager.remove(movie: movie)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .padding(10)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .shadow(radius: 5, x: 5, y: 5)
                            }
                        }.onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.85)) {
                                self.movie = movie
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }
                .padding(15)
            }
            .applyPaddingStatusBar()
            .padding(.top, 50)
            .animationOpenCloseSlideMenu(showSlideMenu)
            
            if movie != nil {
                DetailScreen(movie: $movie, namespaceId: namespaceId)
            }
        }
    }
}

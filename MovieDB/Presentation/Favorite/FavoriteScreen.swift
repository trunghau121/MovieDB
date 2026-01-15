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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.movieManager.movies) { movie in
                    ZStack (alignment: .topTrailing) {
                        AsyncImageApp(url: movie.posterPath)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                        
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
                        coondinator.show(MapRouter.detail(movieId: movie.id))
                    }
                }
            }
            .padding()
        }
        .applyPaddingStatusBar()
        .padding(.top, 50)
        .animationOpenCloseSlideMenu(showSlideMenu)
    }
}

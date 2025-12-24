//
//  MovieTabbed.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct MovieTabbed: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        WithTabBar { selection in
            MovieTabView(movies: homeViewModel.movieTabs)
                .onChange(of: selection) { value in
                    homeViewModel.movieTabs.removeAll()
                    homeViewModel.loadMovieWithTab(tab: value)
                }
        }
    }
}

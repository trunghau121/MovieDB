//
//  DetailScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation
import SwiftUI

struct DetailScreen: View {
    @StateObject var detailViewModel = DetailViewModel()
    private let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }

    var body: some View {
        ZStack {
            Text("Detail Screen: \(movieId)")
                .font(.largeTitle)
                .padding()
        }
    }
}

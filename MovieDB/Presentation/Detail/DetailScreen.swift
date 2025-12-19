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
    @StateObject var detailViewModel = DetailViewModel()
    private let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(height: containerHeight * 0.33)
            
            Rectangle()
                .fill(Color.orange)
                .frame(height: containerHeight * 0.67)
        }
    }
}

#Preview {
    DetailScreen(movieId: 12345678)
}

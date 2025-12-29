//
//  ItemSearch.swift
//  MovieDB
//
//  Created by 60156720 on 12/29/25.
//

import SwiftUI

struct ItemSearch: View {
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            AsyncImageApp(url: movie.posterPath)
                .background(Color.gray)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.textApp)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(movie.overview)
                    .font(.system(size: 14, weight: .medium))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 7)
    }
}

let movieMockup1 = Movie(
    id: 0,
    title: "Springsteen: Deliver Me from Nowhere",
    backdropPath: "/7OwZxXuLPtCFjdqJdiTuEE1DE4J.jpg",
    posterPath: "/csBV3eq4RDjNg1acNQ8kwOZyPlZ.jpg",
    voteAverage: 7.0,
    releaseDate: "2025-10-22",
    overview: "Bruce Springsteen, a young musician on the cusp of global superstardom, struggles to reconcile the pressures of success with the ghosts of his past."
)

#Preview {
    ItemSearch(movie: movieMockup1)
}

//
//  ItemSearch.swift
//  MovieDB
//
//  Created by 60156720 on 12/29/25.
//

import SwiftUI

struct ItemSearch: View {
    var namespaceId: Namespace.ID
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            AsyncImageApp(url: movie.posterPath)
                .background(Color.gray)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                .matchedGeometryEffect(id: movie.id, in: namespaceId)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.textApp)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "title \(movie.id)", in: namespaceId, properties: .position)
                
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

struct ItemSearch_Previews: PreviewProvider {
    struct ContainerView: View {
        @Namespace var namespaceId
        var body: some View {
            ItemSearch(namespaceId: namespaceId, movie: Movie.placeholder[0])
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

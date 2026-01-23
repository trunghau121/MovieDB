//
//  MovieItem.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct MovieItem: View {
    private let width = UIScreen.main.bounds.width / 2.4
    @State private var textHeight: CGFloat = 0
    var namespaceId: Namespace.ID
    var movie: Movie
    var height: CGFloat
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImageApp(url: movie.posterPath)
                .background(Color.gray)
                .frame(width: width, height: height - textHeight - 30)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                .matchedGeometryEffect(id: movie.id, in: namespaceId)
            
            Text(movie.title)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)
                .foregroundColor(.textApp)
                .padding(.bottom, 20)
                .background(
                    GeometryReader { proxy in
                        Color.clear.onAppear {
                            textHeight = proxy.size.height
                        }
                    }
                )
                .matchedGeometryEffect(id: "title \(movie.id)", in: namespaceId, properties: .position)
        }
        .frame(width: width, height: height)
        .padding(.horizontal, 7)
    }
}

struct MovieItem_Previews: PreviewProvider {
    struct ContainerView: View {
        @Namespace var namespaceId
        var body: some View {
            MovieItem(namespaceId: namespaceId, movie: Movie.placeholder[0], height: 300)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

//
//  CarouselMovie.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//

import SwiftUI

struct CarouselMovie: View {
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    var movies: [Movie]
    @Binding var movieScrollVisible: Movie?
    var moveToDetail: ((Int) -> Void)
    let spacing: CGFloat = 20
    let trailingSpace: CGFloat = 180
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset = CGFloat.zero
    
    var body: some View {
        GeometryReader { proxy in
            let itemWidth = proxy.size.width - trailingSpace
            let width: CGFloat = proxy.size.width - (trailingSpace - spacing)
            let ajustMenWidth: CGFloat = (trailingSpace / 2) - spacing
            HStack(spacing: spacing) {
                ForEach(movies.indices, id: \.self) { index in
                    carouselItem(movies[index], width: itemWidth, index: index)
                        .frame(width: itemWidth)
                        .scaleEffect(1.0 - abs(distance(index)) * 0.2 )
                        .opacity(1.0 - abs(distance(index)) * 0.3 )
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + ajustMenWidth + dragOffset)
            .gesture(
                DragGesture()
                    .updating($dragOffset,body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundProgress = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundProgress), movies.count - 1), 0)
                    })
            )
            .onChange(of: currentIndex) { index in
                movieScrollVisible = movies[index]
            }
            .animation(.easeInOut, value: dragOffset == 0)
            
        }
    }
    
    func distance(_ item: Int) -> Double {
        return (Double(currentIndex - item)).remainder(dividingBy: Double(movies.count))
    }
    
    
    
    private func carouselItem(_ movie: Movie, width: CGFloat, index: Int) -> some View {
        VStack(spacing: 15) {
            AsyncImageApp(
                url: movie.posterPath,
                size: .init(
                    width: width,
                    height: 300
                )
            )
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text(movie.title)
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
                .foregroundColor(.white)
                .opacity(1.0 - abs(distance(index)) * 1)
        }
        .onTapGesture {
            moveToDetail(movie.id)
        }
    }
    
    struct RatingView: View {
        var rating: Int
        
        var maximumRating = 5
        var offColor = Color.gray
        var onColor = Color.yellow
        
        var body: some View {
            HStack {
                // Loop from 1 up to the maximum rating
                ForEach(1..<maximumRating + 1, id: \.self) { number in
                    Image(systemName: number > rating ? "star" : "star.fill") // Toggle between empty and filled star
                        .foregroundColor(number > rating ? offColor : onColor)
                        .scaledToFill()
                        .frame(height: 5)
                }
            }
            .buttonStyle(.plain) // Important for correct tap behavior within Lists/Forms
        }
    }
}

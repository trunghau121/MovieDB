//
//  CarouselMovie.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//

import SwiftUI

struct CarouselMovie: View {
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    private let containerHeight: CGFloat = UIScreen.main.bounds.height
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
                    carouselItem(index: index, width: itemWidth)
                        .frame(width: itemWidth)
                        .scaleEffect(1.0 - abs(distance(index)) * 0.2 )
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
    
    
    
    private func carouselItem(index: Int, width: CGFloat) -> some View {
        VStack(spacing: 10) {
            AsyncImageApp(url: movies[index].posterPath)
            .background(Color.gray)
            .frame(width: width, height: containerHeight *  0.37)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .shadowApp.opacity(0.2), radius: 10, x: 5, y: 0)
            
            Text(movies[index].title)
                .font(.system(size: 16, weight: .semibold))
                .lineLimit(1)
                .foregroundColor(.textApp)
                .opacity(1.0 - abs(distance(index)) * 1)
        }
        .onTapGesture {
            moveToDetail(movies[index].id)
        }
    }
}

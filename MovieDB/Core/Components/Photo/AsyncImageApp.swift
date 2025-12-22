//
//  RemotePhoto.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct AsyncImageApp: View {
    let url: String
    let size: CGSize
    
    private var imageURL: URL? {
        return URL(string: Enviroment.photo500Url + url)
    }
    
    var body: some View {
        Group {
            if let url = imageURL {
                RemoteImage(url: url)
            } else {
                placeholder
            }
        }
        .frame(maxWidth: size.width, maxHeight: size.height)
    }
    
    @ViewBuilder
    private var placeholder: some View {
        Color.gray.opacity(0.2)
            .overlay(
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            )
    }
    
    struct RemoteImage: View {
        let url: URL
        
        init(url: URL) {
            self.url = url
        }
        
        var body: some View {
            KFImage(url)
                .placeholder {
                    ProgressView()
                }
                .fade(duration: 0.2)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
    
}

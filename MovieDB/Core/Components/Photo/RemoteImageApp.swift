//
//  RemotePhoto.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation
import SwiftUI

struct RemoteImageApp: View {
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
        .frame(width: size.width, height: size.height)
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
            Group {
                if #available(macCatalyst 15.0, *), #available(iOS 15.0, *) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    ImageView(withURL: url.absoluteString)
                        .scaledToFit()
                }
            }
        }
    }
    
}

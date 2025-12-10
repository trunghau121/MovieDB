//
//  ImageView.swift
//  MovieDB
//
//  Created by 60156720 on 10/24/25.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var imageUI = UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: imageUI)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.imageUI = UIImage(data: data) ?? UIImage()
            }
    }
}

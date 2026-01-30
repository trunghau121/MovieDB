//
//  CastList.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import SwiftUI

struct ScreenshotListView: View {
    let data: [Photo]
    var onSelect: (Photo) -> ()
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(data, id: \.id) { item in
                        Button {
                            onSelect(item)
                        } label: {
                            AsyncImageApp(url: "\(Enviroment.photo780Url + item.filePath)")
                                .background(Color.gray)
                                .frame(width: (UIScreen.main.bounds.width / 1.5), height: (UIScreen.main.bounds.width / 1.5) / 1.8)
                                .clipShape(RoundedCornersShape(radius: 15, conners: [.allCorners]))
                                .shadow(color: .shadowApp.opacity(0.2), radius: 5, x: 2, y: 0)
                        }
                    }
                }
                .padding(.top, 5)
                .padding(.bottom, 10)
                .padding(.horizontal, 15)
            }
        }
    }
}

struct ScreenshotListView_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            ScreenshotListView(data: Photo.placeholder) { photo in
                
            }
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

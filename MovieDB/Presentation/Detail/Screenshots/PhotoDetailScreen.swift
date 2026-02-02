//
//  PhotoDetailScreen.swift
//  MovieDB
//
//  Created by 60156720 on 1/29/26.
//

import SwiftUI
import Kingfisher

struct PhotoDetailScreen: View {
    private let data: [Photo]
    private let photoSelected: Photo
    @State var selected: Int = 0
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    private let containerWidth: CGFloat = UIScreen.main.bounds.width
    
    init(data: [Photo], photoSelected: Photo) {
        self.data = data
        self.photoSelected = photoSelected
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                KFImage(URL(string: "\(Enviroment.photo780Url + (data.first(where: { $0.id == selected })?.filePath ?? "-1"))"))
                    .fade(duration: 0.2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: reader.size.width, height: reader.size.height)
                    .blur(radius: 100)
                
                Color.black.opacity(0.12).ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    TabView(selection: $selected) {
                        ForEach(data, id: \.id) { item in
                            KFImage(URL(string: "\(Enviroment.photo780Url + item.filePath)"))
                                .placeholder {
                                    ProgressView()
                                }
                                .fade(duration: 0.2)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: reader.size.width, height: reader.size.height)
                                .background(Color.clear)
                                .tag(item.id)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .overlay(alignment: .topLeading, content: {
                        Button {
                            coordinator.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .padding(7)
                                .padding(.leading, 7)
                                .padding(.top, 15)
                                .shadow(radius: 7, x: 7, y: 7)
                        }
                    })
                }
                .onAppear {
                    selected = photoSelected.id
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct PhotoDetailScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            PhotoDetailScreen(data: Photo.placeholder, photoSelected: Photo.placeholder[0])
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

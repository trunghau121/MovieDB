//
//  MapRouter.swift
//  MovieDB
//
//  Created by 60156720 on 1/13/26.
//

import SwiftUI

public enum MapRouter: NavigationRouter {
    case main
    case search
    case trailer(movie: Movie)
    case photo(data: [Photo], photoSelected: Photo)
    
    public var transition: NavigationTranisitionStyle {
            switch self {
            case .main:
                return .push
            case .search:
                return .push
            case .trailer(_):
                return .presentModally
            case .photo(_, _):
                return .presentModally
            }
        }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .main:
            RootScreen()
        case .search:
            SearchScreen()
        case .trailer(let movie):
            TrailerVideoScreen(movie: movie)
        case .photo(let data, let photoSelected):
            PhotoDetailScreen(data: data, photoSelected: photoSelected)
        }
    }
}

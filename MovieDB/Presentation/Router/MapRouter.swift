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
    
    public var transition: NavigationTranisitionStyle {
            switch self {
            case .main:
                return .push
            case .search:
                return .push
            case .trailer(_):
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
        }
    }
}

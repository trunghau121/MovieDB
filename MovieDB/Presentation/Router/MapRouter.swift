//
//  MapRouter.swift
//  MovieDB
//
//  Created by 60156720 on 1/13/26.
//

import SwiftUI

public enum MapRouter: NavigationRouter {
    case main
    case detail(movieId: Int)
    case search
    
    public var transition: NavigationTranisitionStyle {
            switch self {
            case .main:
                return .push
            case .search:
                return .push
            case .detail:
                return .push
            }
        }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .main:
            RootScreen()
        case .detail(let movieId):
            DetailScreen(movieId: movieId)
        case .search:
            SearchScreen()
        }
    }
}

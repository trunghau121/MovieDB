//
//  MovieDBRoute.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//

import SwiftUICore

enum MovieDBRoute: AppRoute {
    case home
    case detail(movieId: Int)
    case search
    
    var id: AnyHashable {
        switch self {
        case .home:
            return "home"
        case .detail(let id):
            return "detail-\(id)"
        case .search:
            return "search-viewmodel"
        }
    }
    
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .detail(let movieId):
            DetailScreen(movieId: movieId)
        case .search:
            SearchScreen()
        default:
            EmptyView()
        }
    }
}

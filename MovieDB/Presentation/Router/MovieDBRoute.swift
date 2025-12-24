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
    
    var id: AnyHashable {
        switch self {
        case .home:
            return "home"
        case .detail(let id):
            return "detail-\(id)"
        }
    }
    
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .detail(let movieId):
            DetailScreen(movieId: movieId)
        default:
            EmptyView()
        }
    }
}

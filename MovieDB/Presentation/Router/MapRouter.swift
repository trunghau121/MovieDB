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
    
    public var transition: NavigationTranisitionStyle {
            switch self {
            case .main:
                return .push
            case .search:
                return .push
            }
        }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .main:
            RootScreen()
        case .search:
            SearchScreen()
        }
    }
}

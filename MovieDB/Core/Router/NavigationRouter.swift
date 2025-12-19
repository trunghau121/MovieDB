//
//  Untitled.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation
import SwiftUICore

@MainActor
final class NavigationRouter: ObservableObject {
    public static let shared = NavigationRouter()
    @Published var path: [AnyRoute] = []
    
    func push<V: AppRoute>(_ route: V) {
        withAnimation {
            path.append(AnyRoute(route))
        }
    }
    
    func pop() {
        withAnimation {
            if !path.isEmpty {
                path.removeLast()
            }
        }
    }
    
    
}

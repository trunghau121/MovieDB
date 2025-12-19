//
//  AnyRoute.swift
//  MovieDB
//
//  Created by 60156720 on 12/17/25.
//

import SwiftUI

struct AnyRoute: Identifiable, Hashable {
    // MARK: - Properties
    let id: AnyHashable
    private let _build: () -> AnyView
    
    // MARK: - Init
    init<R: AppRoute>(_ route: R) {
        self.id = AnyHashable(route.id)
        self._build = {
            AnyView(route.build())
        }
    }
    
    // MARK: - Build view
    @ViewBuilder
    func build() -> some View {
        _build()
    }
    
    // MARK: - Hashable
    static func == (lhs: AnyRoute, rhs: AnyRoute) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

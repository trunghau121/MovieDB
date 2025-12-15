//
//  UIApplication.swift
//  MovieDB
//
//  Created by 60156720 on 12/12/25.
//

import UIKit
import SwiftUICore

extension View {
    func systemBarStyle(_ style: SystemBarStyle) -> some View {
        self
            .preference(key: SystemBarStylePreferenceKey.self, value: style)
            .background(style.background.ignoresSafeArea(.container, edges: .top))
    }
}

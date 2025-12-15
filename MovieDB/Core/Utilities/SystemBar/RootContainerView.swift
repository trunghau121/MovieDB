//
//  RootContainerView.swift
//  MovieDB
//
//  Created by 60156720 on 12/15/25.
//

import SwiftUI

struct RootContainerView<Content: View>: View {
    @State var currentStyle: SystemBarStyle?
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .onPreferenceChange(SystemBarStylePreferenceKey.self) { style in
                guard let style else { return }
                apply(style)
                currentStyle = style
            }
            .background(
                StatusBarController(style: currentStyle?.statusBar ?? .default)
                    .frame(width: 0, height: 0)
            )
    }
    
    private func apply(_ style: SystemBarStyle) {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = style.navBarBackground
        appearance.titleTextAttributes = [.foregroundColor: style.titleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: style.titleColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = style.titleColor
        
        guard
                let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let window = scene.windows.first,
                let nav = window.rootViewController as? UINavigationController
            else { return }
        
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.compactAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
        nav.navigationBar.tintColor = style.titleColor
    }
}

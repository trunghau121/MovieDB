//
//  RootScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation
import SwiftUICore
import SwiftUI

struct RootScreen: View {
    @StateObject var router = NavigationRouter.shared
    @StateObject var localizableManager = LocalizableManager.shared
    @State var showSlideMenu = false
    @State var selectedSlideMenu = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack(alignment: .top) {
                    // Slide Menu
                    SlideMenuView(
                        selectedTabMenu: $selectedSlideMenu,
                        showSlideMenu: $showSlideMenu
                    )
                    
                    shaddowViews(scale: 0.62, offsetWidth: 220)
                    shaddowViews(scale: 0.66, offsetWidth: 195)
                    
                    Group {
                        switch(selectedSlideMenu) {
                        case 1:
                            // Favorite screen
                            FavoriteScreen(showSlideMenu: $showSlideMenu)
                                .environmentObject(router)
                        case 2:
                            // Settings screen
                            SettingsScreen(showSlideMenu: $showSlideMenu)
                                .environmentObject(router)
                                .environmentObject(localizableManager)
                        case 3:
                            // Feedback screen
                            FeedbackScreen(showSlideMenu: $showSlideMenu)
                                .environmentObject(router)
                        case 4:
                            // About screen
                            AboutScreen(showSlideMenu: $showSlideMenu)
                                .environmentObject(router)
                        default:
                            // Home screen
                            HomeScreen(showSlideMenu: $showSlideMenu)
                                .environmentObject(router)
                        }
                    }
                    .ignoresSafeArea()
                    .overlay(
                        MainHeader(
                            showSlideMenu: $showSlideMenu,
                            forceWhite: Binding<Bool>(
                                get: {
                                    return selectedSlideMenu == 0
                                },
                                set: { _ in }
                            )
                        ) {
                            withAnimation(.spring()) {
                                showSlideMenu.toggle()
                            }
                        },
                        alignment: .topLeading
                    )
                }
                
                // Handle push screen
                NavigationLink(
                    destination: nextView,
                    isActive: Binding(
                        get: { !router.path.isEmpty },
                        set: { isActive in
                            if !isActive {
                                router.pop()
                            }
                        }
                    )
                ) {
                    EmptyView()
                }
            }
        }
    }
    
    @ViewBuilder
    private var nextView: some View {
        if let route = router.path.last {
            route.build()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func shaddowViews(scale: CGFloat, offsetWidth: CGFloat) -> some View {
        Color.backgroundApp
            .opacity(0.5)
            .cornerRadius(20)
            .shadow(color: Color.backgroundApp.opacity(0.7), radius: 5, x: -5, y: 0)
            .cornerRadius(showSlideMenu ? 15 : 0)
            .scaleEffect(showSlideMenu ? scale : 1)
            .offset(x: showSlideMenu ? UIScreen.main.bounds.width - offsetWidth : 0)
            .ignoresSafeArea()
    }
}

struct RootScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        var body: some View {
            RootScreen()
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

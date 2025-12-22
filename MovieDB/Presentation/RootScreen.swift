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
    @State var presentSlideMenu = false
    @State var selectedSlideMenu = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack(alignment: .top) {
                    // Slide Menu
                    SlideMenuView(
                        selectedTabMenu: $selectedSlideMenu,
                        presentSlideMenu: $presentSlideMenu
                    )
                    
                    TabView(selection: $selectedSlideMenu) {
                        // Home screen
                        HomeScreen()
                            .environmentObject(router)
                            .tag(0)
                            .ignoresSafeArea()
                        
                        // Favorite screen
                        FavoriteScreen()
                            .environmentObject(router)
                            .tag(1)
                            .ignoresSafeArea()
                        
                        // Settings screen
                        SettingsScreen()
                            .environmentObject(router)
                            .tag(2)
                            .ignoresSafeArea()
                        
                        // Feedback screen
                        FeedbackScreen()
                            .environmentObject(router)
                            .tag(3)
                            .ignoresSafeArea()
                        
                        // About screen
                        AboutScreen()
                            .environmentObject(router)
                            .tag(4)
                            .ignoresSafeArea()
                    }
                    .background(Color.backgroundApp)
                    .cornerRadius(presentSlideMenu ? 20 : 0)
                    .scaleEffect(presentSlideMenu ? 0.70 : 1)
                    .offset(x: presentSlideMenu ? UIScreen.main.bounds.width - 150 : 0)
                    .ignoresSafeArea()
                    .overlay(
                        HomeHeader(
                            isShowMenu: $presentSlideMenu,
                            isForceWhite: Binding<Bool>(
                                get: {
                                    return selectedSlideMenu == 0
                                },
                                set: { _ in }
                            )
                        ) {
                            withAnimation(.spring()) {
                                presentSlideMenu.toggle()
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

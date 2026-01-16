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
    @StateObject var localizableManager = LocalizableManager.shared
    @State var showSlideMenu = false
    @State var selectedSlideMenu = 0
    @State var title: String = AppText.homeMenu
    @EnvironmentObject var coordinator: Coordinator<MapRouter>
    private let width = UIScreen.main.bounds.width / 1.8
    
    var body: some View {
        ZStack(alignment: .top) {
            // Slide Menu
            SlideMenuView(
                selectedTabMenu: $selectedSlideMenu,
                showSlideMenu: $showSlideMenu
            )
            
            shaddowViews(scale: 0.62, offsetWidth: width)
            shaddowViews(scale: 0.66, offsetWidth: width - 25)
            
            mainViews()
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    private func mainViews() -> some View {
        Group {
            switch(selectedSlideMenu) {
            case 1:
                // Favorite screen
                FavoriteScreen(showSlideMenu: $showSlideMenu)
                    .environmentObject(localizableManager)
            case 2:
                // Settings screen
                SettingsScreen(showSlideMenu: $showSlideMenu)
                    .environmentObject(localizableManager)
            case 3:
                // Feedback screen
                FeedbackScreen(showSlideMenu: $showSlideMenu)
                    .environmentObject(localizableManager)
            case 4:
                // About screen
                AboutScreen(showSlideMenu: $showSlideMenu)
                    .environmentObject(localizableManager)
            default:
                // Home screen
                HomeScreen(showSlideMenu: $showSlideMenu)
                    .environmentObject(localizableManager)
            }
        }
        .ignoresSafeArea()
        .disabled(showSlideMenu)
        .overlay(
            MainHeader(
                showSlideMenu: $showSlideMenu,
                forceWhite: Binding<Bool>(
                    get: {
                        return selectedSlideMenu == 0
                    },
                    set: { _ in }
                ),
                title: getTitle(),
                openMenu: {
                    withAnimation(.spring()) {
                        showSlideMenu.toggle()
                    }
                },
                openSearch: {
                    coordinator.show(MapRouter.search)
                }
            ),
            alignment: .topLeading
        )
    }
    
    private func getTitle() -> String {
        switch(selectedSlideMenu) {
        case 1:
            // Favorite screen
            AppText.favoriteMenu.localized()
        case 2:
            // Settings screen
            AppText.settingMenu.localized()
        case 3:
            // Feedback screen
            AppText.feedbackMenu.localized()
        case 4:
            // About screen
            AppText.aboutMenu.localized()
        default:
            // Home screen
            AppText.homeMenu.localized()
        }
    }
    
    @ViewBuilder
    private func shaddowViews(scale: CGFloat, offsetWidth: CGFloat) -> some View {
        Color.shadowApp
            .opacity(0.5)
            .cornerRadius(20)
            .shadow(color: .shadowApp.opacity(0.7), radius: 5, x: -5, y: 0)
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

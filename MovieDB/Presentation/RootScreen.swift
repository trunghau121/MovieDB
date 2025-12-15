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
    
    var body: some View {
        RootContainerView {
            NavigationView {
                ZStack {
                    // Home screen
                    HomeScreen()
                        .environmentObject(router)
                        .systemBarStyle(AppBarStyle.defaultStyle)
                    
                    // Handle push screen
                    NavigationLink(
                        destination: nextView,
                        isActive: Binding(
                            get: { !router.stask.isEmpty },
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
        .preferredColorScheme(.light)
    }
    
    private var nextView: some View {
        router.stask.last ?? AnyView(EmptyView())
    }
}

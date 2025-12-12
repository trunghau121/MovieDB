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
        NavigationView {
            ZStack {
                // Home screen
                HomeScreen()
                .environmentObject(router)
                
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
    
    private var nextView: some View {
        router.stask.last ?? AnyView(EmptyView())
    }
}

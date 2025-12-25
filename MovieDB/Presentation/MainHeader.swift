//
//  HomeHeader.swift
//  MovieDB
//
//  Created by 60156720 on 12/12/25.
//

import SwiftUI

struct MainHeader: View {
    @Binding var showSlideMenu: Bool
    @Binding var forceWhite: Bool
    var openMenu: (() -> Void)
    
    var body: some View {
        HStack {
            Button {
                openMenu()
            } label: {
                VStack(alignment: .leading,spacing: 5) {
                    Capsule()
                        .fill(getColor())
                        .frame(width: showSlideMenu ? 25 : 20, height: 3)
                        .rotationEffect(.init(degrees: showSlideMenu ? -50 : 0))
                        .offset(x: showSlideMenu ? 3 : 0, y: showSlideMenu ? 9 : 0)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Capsule()
                            .fill(getColor())
                            .frame(width: 25, height: 3)
                        
                        Capsule()
                            .fill(getColor())
                            .frame(width: showSlideMenu ? 25 : 15, height: 3)
                            .offset(y: showSlideMenu ? -8 : 0)
                    }
                    .rotationEffect(.init(degrees: showSlideMenu ? 50 : 0))
                }
                .shadow(radius: 5, x: 5, y: 5)
            }
            
            Spacer()
            if showSlideMenu {
                Image(AppIcon.horizontalLogo)
                Spacer()
            }
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(getColor())
                .font(.title2)
                .shadow(radius: 5, x: 5, y: 5)
        }
        .applyPaddingStatusBar()
        .padding()
        .ignoresSafeArea()
    }
    
    func getColor() -> Color {
        if !showSlideMenu && forceWhite {
            return .white
        } else if showSlideMenu {
            return .backgroundApp
        } else {
            return .slideMenu
        }
    }
}

struct MainHeader_Previews: PreviewProvider {
    
    struct ContainerView: View {
        @State var forceWhite: Bool = false
        @State var showSlideMenu: Bool = false
        var body: some View {
            MainHeader(showSlideMenu: $showSlideMenu, forceWhite: $forceWhite) {
                withAnimation(.spring()) {
                    showSlideMenu.toggle()
                }
            }
            .background(Color.black)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
    
    
}

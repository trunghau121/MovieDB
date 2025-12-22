//
//  HomeHeader.swift
//  MovieDB
//
//  Created by 60156720 on 12/12/25.
//

import SwiftUI

struct HomeHeader: View {
    @Binding var isShowMenu: Bool
    @Binding var isForceWhite: Bool
    var openMenu: (() -> Void)
    
    var body: some View {
        HStack {
            Button {
                openMenu()
            } label: {
                VStack(alignment: .leading,spacing: 5) {
                    Capsule()
                        .fill(getColor())
                        .frame(width: isShowMenu ? 25 : 20, height: 3)
                        .rotationEffect(.init(degrees: isShowMenu ? -50 : 0))
                        .offset(x: isShowMenu ? 3 : 0, y: isShowMenu ? 9 : 0)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Capsule()
                            .fill(getColor())
                            .frame(width: 25, height: 3)
                        
                        Capsule()
                            .fill(getColor())
                            .frame(width: isShowMenu ? 25 : 15, height: 3)
                            .offset(y: isShowMenu ? -8 : 0)
                    }
                    .rotationEffect(.init(degrees: isShowMenu ? 50 : 0))
                }
                .shadow(radius: 5, x: 5, y: 5)
            }
            .padding()
            
            Spacer()
            if isShowMenu {
                Image(AppIcon.horizontalLogo)
                Spacer()
            }
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(getColor())
                .font(.title2)
                .shadow(radius: 5, x: 5, y: 5)
                .padding()
        }
    }
    
    func getColor() -> Color {
        if !isShowMenu && isForceWhite {
            return .white
        } else if isShowMenu {
            return .backgroundApp
        } else {
            return .slideMenu
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    
    struct ContainerView: View {
        @State var isForceWhite: Bool = false
        @State var isShowMenu: Bool = false
        var body: some View {
            HomeHeader(isShowMenu: $isShowMenu, isForceWhite: $isForceWhite) {
                withAnimation(.spring()) {
                    isShowMenu.toggle()
                }
            }
            .background(Color.black)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
    
    
}

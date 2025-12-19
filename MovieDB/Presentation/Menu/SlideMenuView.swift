//
//  SlideMenuView.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import SwiftUI

struct SlideMenuView: View {
    @Binding var selectedTabMenu: Int
    @Binding var presentSlideMenu: Bool
    private let maxWidth: CGFloat = 270
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: maxWidth)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    banner()
                    ForEach(SlideMenuType.allCases, id: \.self) { row in
                        RowView(
                            isSelected: selectedTabMenu == row.rawValue,
                            icon: row.icon,
                            title: row.title
                        ) {
                            presentSlideMenu.toggle()
                            self.selectedTabMenu = row.rawValue
                        }
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: maxWidth)
                .background(Color.white)
            }
            Spacer()
        }
        .background(Color.clear)
    }
    
    private func banner() -> some View {
        VStack(alignment: .center) {
            Image(AppIcon.horizontalLogo)
        }
        .frame(width: maxWidth)
        .padding(.bottom, 30)
    }
    
    private func RowView(isSelected: Bool, icon: String, title: String, action: @escaping (() -> ())) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack (spacing: 0) {
                    Rectangle()
                        .fill(isSelected ? .purple : .white)
                        .frame(width: 5)
                    
                    ZStack {
                        Image(systemName: icon)
                            .scaledToFit()
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 30, height: 30)
                    }
                    .frame(width: 50, height: 30)
                    
                    Text(title.localized())
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(isSelected ? .black : .gray)
                    
                    Spacer()
                }
            }
            .frame(height: 50)
            .background(
                LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
            )
        }
    }
}

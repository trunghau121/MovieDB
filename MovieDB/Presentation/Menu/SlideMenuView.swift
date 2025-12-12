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
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading) {
                    banner()
                    ForEach(SlideMenuType.allCases, id: \.self) { row in
//                        RowView(
//                            isSelected: selectedTabMenu == row.rawValue,
//                            icon: row.icon,
//                            title: row.title,
//                            
//                        )
//                        self.selectedSllideMenu =
                    }
                }
            }
            Spacer()
        }
        .background(Color.clear)
    }
    
    private func banner() -> some View {
        VStack(alignment: .center) {
            Image(AppIcon.horizontalLogo)
        }
    }
    
    private func RowView(isSelected: Bool, icon: String, title: String, isHideDivider: Bool, action: @escaping (() -> ())) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack (spacing: 20){
                    Rectangle()
                }
            }
        }
    }
}

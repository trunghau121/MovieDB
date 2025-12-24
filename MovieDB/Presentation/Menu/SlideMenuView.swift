//
//  SlideMenuView.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import SwiftUI

struct SlideMenuView: View {
    @Binding var selectedTabMenu: Int
    @Binding var showSlideMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(SlideMenuType.allCases, id: \.self) { row in
                RowView(
                    isSelected: selectedTabMenu == row.rawValue,
                    icon: row.icon,
                    title: row.title
                ) {
                    withAnimation(.spring()) {
                        showSlideMenu.toggle()
                        self.selectedTabMenu = row.rawValue
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 100)
        .background(.slideMenu)
    }
    
    private func RowView(isSelected: Bool, icon: String, title: String, action: @escaping (() -> ())) -> some View {
        Button {
            action()
        } label: {
            HStack {
                HStack (spacing: 10) {
                    Spacer()
                        .frame(width: 10)
                    
                    Image(systemName: icon)
                        .font(.title3)
                        .frame(width: 30)
                        .foregroundColor(isSelected ? .white : .gray)
                    
                    Text(title.localized())
                        .fontWeight(.semibold)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(isSelected ? .white : .gray)
                    
                    Spacer()
                }
                .frame(width: 200, height: 50)
                .background(isSelected ? .selectedSlideMenu : .slideMenu)
                .clipShape(
                    RoundedCornersShape(
                        radius: 15,
                        conners: [.topRight, .bottomRight]
                    )
                )
                
                Spacer()
            }
        }
    }
}


struct SlideMenuView_Previews: PreviewProvider {
    // A container view to hold the state
    struct ContainerView: View {
        @State var presentSlideMenu = false
        @State var selectedSlideMenu = 0
        
        var body: some View {
            SlideMenuView(
                selectedTabMenu: $selectedSlideMenu,
                showSlideMenu: $presentSlideMenu
            )
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

//
//  TabButtonLabelsView.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct ActiveTabLabel: View {
    let tabItem: TabItem
    
    var body: some View {
        VStack {
            Text(tabItem.title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.selectedSlideMenu)
            
            Capsule()
                .fill(.selectedSlideMenu)
                .frame(height: 3)
        }
    }
}

struct InActiveTabLabel: View {
    let tabItem: TabItem

    var body: some View {
        VStack {
            Text(tabItem.title)
                .font(.system(size: 16, weight: .semibold))
            
            Capsule()
                .fill(.selectedSlideMenu.opacity(0))
                .frame(height: 3)
        }
    }
}

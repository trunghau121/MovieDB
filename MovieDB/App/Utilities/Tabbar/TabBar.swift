//
//  TabBar.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

struct WithTabBar<Content>: View where Content: View {
    @State private var selection: Tabs = .popular
    @ViewBuilder var content: (Tabs) -> Content

    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabBar(selection: $selection)
                content(selection)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

struct TabBar: View {
    @Binding var selection: Tabs
    @State private var symbolTrigger: Bool = true
    @Namespace private var tabItemNameSpace
    
    func changeTabTo(_ tab: Tabs) {
        withAnimation(.bouncy(duration: 0.3, extraBounce: 0.15)) {
            selection = tab
        }
        symbolTrigger.toggle()
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                Button(action: {
                    changeTabTo(tab)
                }) {
                    if tab == selection {
                        ActiveTabLabel(tabItem: tab.item)
                            .matchedGeometryEffect(id: "tabItem", in: tabItemNameSpace)
                    } else {
                        InActiveTabLabel(tabItem: tab.item)
                    }
                }
                .withTabButtonStyle()
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .padding(6)
    }
}

#Preview {
    WithTabBar { selection in
        Text("Hello world")
    }
}

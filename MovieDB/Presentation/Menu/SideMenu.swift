//
//  SideMenu.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import SwiftUI

struct SlideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransaction: AnyTransition = .move(edge: .leading)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .transition(edgeTransaction)
                    .background(Color.clear)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

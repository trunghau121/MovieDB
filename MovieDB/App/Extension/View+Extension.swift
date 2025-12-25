//
//  View+Extension.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import SwiftUI

extension View {
    func animationOpenCloseSlideMenu(_ isShowMenu: Bool) -> some View {
        self
            .background(.backgroundApp)
            .cornerRadius(isShowMenu ? 15 : 0)
            .scaleEffect(isShowMenu ? 0.70 : 1)
            .offset(x: isShowMenu ? UIScreen.main.bounds.width - 170 : 0)
            .ignoresSafeArea()
    }
    
    func applyPaddingStatusBar() -> some View {
        self.padding(.top, AppContainer.getStatusBarHeight())
    }
}

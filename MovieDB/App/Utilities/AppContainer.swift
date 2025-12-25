//
//  AppContainner.swift
//  MovieDB
//
//  Created by 60156720 on 12/24/25.
//

import Foundation
import UIKit

class AppContainer {
    static func getStatusBarHeight() -> CGFloat {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}

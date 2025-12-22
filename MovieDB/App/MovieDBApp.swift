//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import SwiftUI
import Kingfisher

@main
struct MovieDBApp: App {
    init() {
        KingfisherManager.shared.downloader.downloadTimeout = 60.0
    }
    
    var body: some Scene {
        WindowGroup {
            RootScreen()
        }
    }
}

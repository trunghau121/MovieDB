//
//  AppDelegate.swift
//  MovieDB
//
//  Created by 60156720 on 1/13/26.
//

import UIKit
import Kingfisher

@main
final class AppDelegate: NSObject, UIApplicationDelegate {
    
    override init() {
        KingfisherManager.shared.downloader.downloadTimeout = 60.0
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sessionRole = connectingSceneSession.role
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: sessionRole)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}

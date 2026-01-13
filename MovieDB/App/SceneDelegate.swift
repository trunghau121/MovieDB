//
//  SceneDelegate.swift
//  MovieDB
//
//  Created by 60156720 on 1/13/26.
//

import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
        
    private let coordinator: Coordinator<MapRouter> = .init(startingRoute: .main)
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}

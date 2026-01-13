//
//  Coordinator.swift
//  MovieDB
//
//  Created by 60156720 on 1/13/26.
//

import SwiftUI
import UIKit

open class Coordinator<Router: NavigationRouter>: ObservableObject {

    // MARK: - Properties
    public private(set) var navigationController: UINavigationController
    public let startingRoute: Router?

    // MARK: - Init
    public init(
        navigationController: UINavigationController = UINavigationController(),
        startingRoute: Router? = nil
    ) {
        self.navigationController = navigationController
        self.startingRoute = startingRoute
    }

    deinit {
        print("Coordinator deinit")
    }

    // MARK: - Start
    public func start(animated: Bool = false) {
        guard let route = startingRoute else { return }
        setRoot(route, animated: animated)
    }

    // MARK: - Navigation
    public func show(_ route: Router, animated: Bool = true) {
        let viewController = makeViewController(for: route)

        switch route.transition {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)

        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            topViewController?.present(viewController, animated: animated)

        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            topViewController?.present(viewController, animated: animated)
        }
    }

    public func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    public func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }

    public func dismiss(animated: Bool = true) {
        topViewController?.dismiss(animated: animated)
    }

    // MARK: - Private helpers
    private func setRoot(_ route: Router, animated: Bool) {
        let viewController = makeViewController(for: route)
        navigationController.setViewControllers([viewController], animated: animated)
    }

    private func makeViewController(for route: Router) -> UIViewController {
        let view = route.view().environmentObject(self)
        let hostingController = UIHostingController(rootView: view)
        return hostingController
    }

    private var topViewController: UIViewController? {
        navigationController.topViewController
    }
}

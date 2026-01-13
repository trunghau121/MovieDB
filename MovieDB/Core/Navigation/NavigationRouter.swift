//
//  NavigationRouter.swift
//  MovieDB
//
//  Created by 60156720 on 1/13/26.
//

import SwiftUI

public protocol NavigationRouter {
    
    associatedtype V: View

    var transition: NavigationTranisitionStyle { get }
    
    /// Creates and returns a view of assosiated type
    ///
    @ViewBuilder
    func view() -> V
}

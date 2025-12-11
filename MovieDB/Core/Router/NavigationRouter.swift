//
//  Untitled.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation
import SwiftUICore

final class NavigationRouter: ObservableObject {
    @Published var stask: [AnyView] = []
    
    func push<V: View>(_ view: V) {
        withAnimation {
            stask.append(AnyView(view))
        }
    }
    
    func pop() {
        withAnimation {
            if !stask.isEmpty {
                stask.removeLast()
            }
        }
    }
    
    
}

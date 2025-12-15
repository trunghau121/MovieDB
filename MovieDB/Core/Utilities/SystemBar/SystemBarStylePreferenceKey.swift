//
//  BarStylePreferenceKey.swift
//  MovieDB
//
//  Created by 60156720 on 12/15/25.
//

import SwiftUICore

struct SystemBarStylePreferenceKey: PreferenceKey {
    static var defaultValue: SystemBarStyle?
    
    static func reduce(value: inout SystemBarStyle?, nextValue: () -> SystemBarStyle?) {
        value = nextValue() ?? value
    }
    
}

//
//  LocalizableManager.swift
//  MovieDB
//
//  Created by 60156720 on 12/24/25.
//

import Foundation
import SwiftUI

@MainActor
class LocalizableManager: ObservableObject {
    
    static let shared = LocalizableManager()
    
    @AppStorage("currentLanguage")
    private var storedLanguage: AppLanguage = .english
    
    @Published var currentLanguage: AppLanguage = .english {
        didSet {
            storedLanguage = currentLanguage
            Bundle.setLanguage(language: currentLanguage.rawValue)
        }
    }
    
    private init() {
        currentLanguage = storedLanguage
        Bundle.setLanguage(language: storedLanguage.rawValue)
    }
}

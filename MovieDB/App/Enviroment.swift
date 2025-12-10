//
//  Enviroment.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import Foundation

public enum Enviroment {
    private enum Keys: String {
        case baseUrl = "API_BASE_URL"
        case apiKey = "API_KEY"
        case photo500Url = "PHOTO_500_URL"
        case photo200Url = "PHOTO_200_URL"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info.plist file not found")
        }
        return dict
    }()
    
    private static func value<T>(for key: Keys) -> T {
        guard let value = infoDictionary[key.rawValue] as? T else {
            fatalError("Key '\(key.rawValue)' not set in Info.plist, or is of the wrong type.")
        }
        return value
    }
    
    static let baseUrl: String = Enviroment.value(for: .baseUrl)
    static let apiKey: String = Enviroment.value(for: .apiKey)
    static let photo500Url: String = Enviroment.value(for: .photo500Url)
    static let photo200Url: String = Enviroment.value(for: .photo200Url)
    
}


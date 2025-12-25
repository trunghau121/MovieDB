//
//  LanguageTypes.swift
//  MovieDB
//
//  Created by 60156720 on 12/24/25.
//
enum AppLanguage: String, CaseIterable, RawRepresentable, Identifiable {
    case english = "en"
    case vietnamese = "vi"
    
    var id: String { rawValue }
    
    var name : String {
        switch self {
        case .vietnamese:
            AppText.vietnameseSetting.localized()
        default:
            AppText.englishSetting.localized()
        }
    }
}

//
//  SlideMenuType.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

enum SlideMenuType: Int, CaseIterable {
    case Favorite
    case Language
    case Feedback
    case About
    
    var title: String {
        switch self {
        case .Favorite:
            return AppText.favoriteMenu.localized()
        case .Language:
            return AppText.languageMenu.localized()
        case .Feedback:
            return AppText.feedbackMenu.localized()
        case .About:
            return AppText.aboutMenu.localized()
        }
    }
    
    var icon: String {
        switch self {
        case .Favorite:
            return AppIcon.favorite
        case .Language:
            return AppIcon.language
        case .Feedback:
            return AppIcon.feedback
        case .About:
            return AppIcon.about
        }
    }
}

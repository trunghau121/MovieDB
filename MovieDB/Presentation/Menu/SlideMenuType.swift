//
//  SlideMenuType.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

enum SlideMenuType: Int, CaseIterable {
    case Home
    case Favorite
    case Settings
    case Feedback
    case About
    
    var title: String {
        switch self {
        case .Home:
            return AppText.homeMenu.localized()
        case .Favorite:
            return AppText.favoriteMenu.localized()
        case .Settings:
            return AppText.settingMenu.localized()
        case .Feedback:
            return AppText.feedbackMenu.localized()
        case .About:
            return AppText.aboutMenu.localized()
        }
    }
    
    var icon: String {
        switch self {
        case .Home:
            return AppIcon.home
        case .Favorite:
            return AppIcon.favorite
        case .Settings:
            return AppIcon.settings
        case .Feedback:
            return AppIcon.feedback
        case .About:
            return AppIcon.about
        }
    }
}

//
//  Tabs.swift
//  MovieDB
//
//  Created by 60156720 on 12/23/25.
//

import Foundation

enum Tabs: CaseIterable {
    case popular, now, soon
    var item: TabItem {
        switch self {
            case .popular:
                .init(title: AppText.popularTab.localized())
            case .now:
                .init(title: AppText.nowTab.localized())
            case .soon:
                .init(title: AppText.soonTab.localized())
        }
    }
}

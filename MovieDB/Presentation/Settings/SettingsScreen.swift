//
//  SettingsScreen.swift
//  MovieDB
//
//  Created by 60156720 on 12/22/25.
//

import SwiftUI

struct SettingsScreen: View {
    @Binding var showSlideMenu: Bool
    @EnvironmentObject var localizableManager: LocalizableManager
    
    var body: some View {
        ZStack (alignment: .top) {
            ZStack (alignment: .top) {
                Form {
                    Section(
                        header: Text(AppText.language.localized())
                            .applyPaddingStatusBar()
                    ) {
                        ForEach(AppLanguage.allCases) { lang in
                            HStack {
                                Text(lang.name)
                                Spacer()
                                if lang == localizableManager.currentLanguage {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.primary)
                                }
                            }
                            .onTapGesture {
                                localizableManager.currentLanguage = lang
                            }
                        }
                    }
                }
            }
            
            Text(AppText.settingMenu.localized())
                .font(.title2)
                .padding()
        }
        .applyPaddingStatusBar()
        .animationOpenCloseSlideMenu(showSlideMenu)
    }

}

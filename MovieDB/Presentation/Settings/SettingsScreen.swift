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
                            Button {
                                localizableManager.currentLanguage = lang
                            } label: {
                                HStack {
                                    Text(lang.name)
                                        .foregroundColor(.textApp)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    if lang == localizableManager.currentLanguage {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.textApp)
                                    }
                                }
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

struct SettingsScreen_Previews: PreviewProvider {
    struct ContainerView: View {
        @State var showSlideMenu: Bool = false
        var localizableManager: LocalizableManager = LocalizableManager.shared
        var body: some View {
            SettingsScreen(showSlideMenu: $showSlideMenu)
                .environmentObject(localizableManager)
        }
    }
    
    static var previews: some View {
        ContainerView()
    }
}

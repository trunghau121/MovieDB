//
//  Bundle+Extension.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation
import UIKit

extension Bundle {
    private static var bundle: Bundle!
    
    static func setLanguage(language: String) {
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        bundle = path != nil ? Bundle(path: path!) : Bundle.main
    }
    
    static func localizedBundle() -> Bundle {
        bundle ?? Bundle.main
    }
}

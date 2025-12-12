//
//  Bundle+Extension.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation

extension Bundle {
    private static var bundle: Bundle!
    
    static func localizedBundle() -> Bundle {
        bundle ?? Bundle.main
    }
}

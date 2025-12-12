//
//  String+Extension.swift
//  MovieDB
//
//  Created by 60156720 on 12/11/25.
//

import Foundation

extension String {
    func localized() -> String {
        return Bundle.localizedBundle().localizedString(forKey: self, value: nil, table: nil)
    }
}

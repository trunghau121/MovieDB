//
//  Data+StructJSON.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

import Foundation

public extension Data {
    var json: String {
        let invalidJson = "invalid JSON"
        return String(data: self, encoding: String.Encoding.utf8) ?? invalidJson
    }
}

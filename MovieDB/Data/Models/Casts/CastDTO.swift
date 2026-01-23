//
//  Cast.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import Foundation

public struct CastDTO: Codable {
    var adult: Bool?
    var castId: Int?
    var character: String?
    var creditId: String?
    var gender: Int?
    var id: Int?
    var knownForDepartment: String?
    var name: String?
    var order: Int?
    var originalName: String?
    var popularity: Double?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case order = "order"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
    }
}

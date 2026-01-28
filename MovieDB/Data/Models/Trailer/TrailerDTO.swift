//
//  TrailerVideoDTO.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

import Foundation

public struct TrailerDTO: Codable {
    var id: String?
    var iso31661: String?
    var iso6391: String?
    var key: String?
    var name: String?
    var official: Bool?
    var publishedAt: String?
    var site: String?
    var size: Int?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case iso31661 = "iso_3166_1"
        case iso6391 = "iso_639_1"
        case key = "key"
        case name = "name"
        case official = "official"
        case publishedAt = "published_at"
        case site = "site"
        case size = "size"
        case type = "type"
    }
}

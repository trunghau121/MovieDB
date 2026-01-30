//
//  ImageDTO.swift
//  MovieDB
//
//  Created by 60156720 on 1/29/26.
//

import Foundation

struct PhotoDTO: Codable {
    var aspectRatio: Double?
    var height: Int?
    var iso3166_1, iso639_1, filePath: String?
    var voteAverage: Double?
    var voteCount, width: Int?
    
    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case height
        case iso3166_1 = "iso_3166_1"
        case iso639_1 = "iso_639_1"
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }
}

//
//  TrailerListDTO.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

import Foundation

public struct TrailerListDTO: Codable {
    var videos: [TrailerDTO]?
    
    enum CodingKeys: String, CodingKey {
        case videos = "results"
    }
}

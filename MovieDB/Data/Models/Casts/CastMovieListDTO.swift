//
//  CastMovieList.swift
//  MovieDB
//
//  Created by 60156720 on 1/30/26.
//

import Foundation

public struct CastMovieListDTO: Codable {
    var cast: [MovieDTO]?
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
    }
}

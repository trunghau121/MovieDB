//
//  CastList.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

import Foundation

public struct CastListDTO: Codable {
    var cast: [CastDTO]?
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
    }
}

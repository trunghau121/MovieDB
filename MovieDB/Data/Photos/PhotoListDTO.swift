//
//  ImageListDTO.swift
//  MovieDB
//
//  Created by 60156720 on 1/29/26.
//

import Foundation

struct PhotoListDTO: Codable {
    var backdrops: [PhotoDTO]?
    var id: Int?
    var logos, posters: [PhotoDTO]?
}

//
//  MovieList.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

public struct MovieListDTO: Codable {
    var currentPage: Int?
    var data: [MovieDTO]?
    var totalCountPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "page"
        case data = "results"
        case totalCountPages = "total_pages"
    }
}

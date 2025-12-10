//
//  Movie.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//
import Foundation

public struct Movie: Codable {
    var id: Int?
    var title: String?
    var backdropPath: String?
    var posterPath: String?
    var voteAverage: Double?
    var releaseDate: String?
    var overview: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case overview = "overview"
    }
}

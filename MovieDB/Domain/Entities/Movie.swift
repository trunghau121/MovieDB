//
//  Movie.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

public struct Movie {
    public let id: Int
    public let title: String
    public let backdropPath: String
    public let posterPath: String
    public let voteAverage: Double
    public let releaseDate: String
    public let overview: String
    
    public init(id: Int, title: String, backdropPath: String, posterPath: String, voteAverage: Double, releaseDate: String, overview: String) {
        self.id = id
        self.title = title
        self.backdropPath = backdropPath
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.overview = overview
    }
}

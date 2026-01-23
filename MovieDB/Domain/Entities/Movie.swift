//
//  Movie.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

public struct Movie: Identifiable, Hashable, Codable {
    public let id: Int
    public let title: String
    public let backdropPath: String
    public let posterPath: String
    public let voteAverage: Double
    public let releaseDate: String
    public let overview: String
    public let runtime: Int
    public let genres: [Genre]
    
    public init(id: Int, title: String, backdropPath: String, posterPath: String, voteAverage: Double, releaseDate: String, overview: String, runtime: Int, genres: [Genre]) {
        self.id = id
        self.title = title
        self.backdropPath = backdropPath
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.overview = overview
        self.runtime = runtime
        self.genres = genres
    }
    
    static let placeholder: [Self] = (1..<11).map { index in
        .init(
            id: -1 * index,
            title: "                               ",
            backdropPath: "",
            posterPath: "",
            voteAverage: 6.0,
            releaseDate: "2026-01-22",
            overview: "Trust frays when a team of Miami cops discovers millions in cash inside a run-down stash house, calling everyone — and everything — into question.",
            runtime: 130,
            genres: [
                Genre(id: 0, name: "     "),
                Genre(id: 0, name: "     ")
            ]
        )
    }
}

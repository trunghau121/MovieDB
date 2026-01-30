//
//  Image.swift
//  MovieDB
//
//  Created by 60156720 on 1/29/26.
//

public struct Photo: Identifiable, Hashable, Codable {
    public var id: Int
    let aspectRatio: Double
    let height: Int
    let iso3166_1, iso639_1, filePath: String
    let voteAverage: Double
    let voteCount, width: Int
    
    init(aspectRatio: Double, height: Int, iso3166_1: String, iso639_1: String, filePath: String, voteAverage: Double, voteCount: Int, width: Int) {
        self.aspectRatio = aspectRatio
        self.height = height
        self.iso3166_1 = iso3166_1
        self.iso639_1 = iso639_1
        self.filePath = filePath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.width = width
        id = filePath.hashValue
    }
    
    static let placeholder: [Self] = (1..<11).map { index in
            .init(
                aspectRatio: 0,
                height: 0,
                iso3166_1: "",
                iso639_1: "",
                filePath: "\(index)",
                voteAverage: 0,
                voteCount: 0,
                width: 0
            )
    }
}

//
//  Trailer.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

public struct Trailer: Identifiable, Hashable, Codable {
    public let id: String
    public let iso31661: String
    public let iso6391: String
    public let key: String
    public let name: String
    public let official: Bool
    public let publishedAt: String
    public let site: String
    public let size: Int
    public let type: String
    
    init(id: String, iso31661: String, iso6391: String, key: String, name: String, official: Bool, publishedAt: String, site: String, size: Int, type: String) {
        self.id = id
        self.iso31661 = iso31661
        self.iso6391 = iso6391
        self.key = key
        self.name = name
        self.official = official
        self.publishedAt = publishedAt
        self.site = site
        self.size = size
        self.type = type
    }
    
    func getThumbnail() -> String {
        return "https://i3.ytimg.com/vi_webp/\(key)/hqdefault.webp"
    }
    
    static let placeholder: [Self] = (1..<11).map { index in
            .init(
                id: "\(index)",
                iso31661: "",
                iso6391: "",
                key: "",
                name: "Dr. Kelson finds himself in a shocking new relationship - with consequences that could change the world as they know it - and Spike's encounter with Jimmy Crystal becomes a nightmare he can't escape.",
                official: false,
                publishedAt: "",
                site: "",
                size: 0,
                type: ""
            )
    }
}

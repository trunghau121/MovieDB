//
//  Genre.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

public struct Genre: Identifiable, Hashable, Codable {
    public let id: Int
    public let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

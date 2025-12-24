//
//  MovieRepository.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

public protocol MovieRepository {
    func getTrending(language: String?) async throws -> [Movie]
    func getPopular(language: String?) async throws -> [Movie]
    func getNow(language: String?) async throws -> [Movie]
    func getSoon(language: String?) async throws -> [Movie]
}

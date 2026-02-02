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
    func getDetail(movieId: Int, language: String?) async throws -> Movie?
    func didSearch(query: String, language: String?) async throws -> [Movie]
    func getCastCrew(movieId: Int, language: String?) async throws -> [Cast]
    func getTrailerVideos(movieId: Int, language: String?) async throws -> [Trailer]
    func getPhotos(movieId: Int, language: String?) async throws -> PhotoList
    func getCastDetail(personId: Int, language: String?) async throws -> Cast
    func getCastMovies(personId: Int, language: String?) async throws -> [Movie]
}

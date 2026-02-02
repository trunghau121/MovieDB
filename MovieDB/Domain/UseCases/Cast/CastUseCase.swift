//
//  CastUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

final class CastUseCase {
    private var repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func getCastCrew(movieId: Int, language: String?) async throws -> [Cast] {
        try await repository.getCastCrew(movieId: movieId, language: language)
    }
    
    public func getCastDetail(personId: Int, language: String?) async throws -> Cast {
        try await repository.getCastDetail(personId: personId, language: language)
    }
    
    public func getCastMovies(personId: Int, language: String?) async throws -> [Movie] {
        try await repository.getCastMovies(personId: personId, language: language)
    }
}

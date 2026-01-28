//
//  TrailerUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 1/27/26.
//

struct TrailerUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(movieId: Int, language: String?) async throws -> [Trailer] {
        try await repository.getTrailerVideos(movieId: movieId, language: language)
    }
}

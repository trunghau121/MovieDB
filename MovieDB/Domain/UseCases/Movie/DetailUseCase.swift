//
//  DetailUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 12/26/25.
//

final class DetailUseCase {
    private var repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(movieId: Int, language: String?) async throws -> Movie? {
        try await repository.getDetail(movideId: movieId, language: language)
    }
}

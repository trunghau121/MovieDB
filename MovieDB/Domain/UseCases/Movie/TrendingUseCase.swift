//
//  TrendingUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

public final class TrendingUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(language: String) async throws -> [Movie] {
        try await repository.getTrending(language: language)
    }
}

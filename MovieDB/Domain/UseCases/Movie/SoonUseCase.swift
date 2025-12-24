//
//  SoonUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 12/24/25.
//

public final class SoonUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(language: String) async throws -> [Movie] {
        try await repository.getSoon(language: language)
    }
}

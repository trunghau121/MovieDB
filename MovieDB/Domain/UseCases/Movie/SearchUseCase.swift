//
//  SearchUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 12/29/25.
//

public final class SearchUseCase {
    private var repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(query: String, language: String) async throws -> [Movie] {
        try await repository.didSearch(query: query, language: language)
    }
    
}

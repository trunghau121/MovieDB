//
//  PhotoUseCase.swift
//  MovieDB
//
//  Created by 60156720 on 1/29/26.
//

struct PhotoUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute(movieId: Int, language: String?) async throws -> PhotoList {
        try await repository.getPhotos(movieId: movieId, language: language)
    }
}

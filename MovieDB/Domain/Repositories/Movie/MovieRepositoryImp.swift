//
//  MovieRepositoryImp.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

public class MovieRepositoryImp: MovieRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = .shared) {
        self.apiClient = apiClient
    }
    
    public func getTrending(language: String?) async throws -> [Movie] {
        let query: [String: String?] = [
            "language": language
        ]
        let dtoResult: MovieListDTO = try await apiClient.request(APIPath.Trending, query: query)
        return dtoResult.toDomain()
    }
    
    public func getPopular(language: String?) async throws -> [Movie] {
        let query: [String: String?] = [
            "language": language
        ]
        let dtoResult: MovieListDTO = try await apiClient.request(APIPath.Popular, query: query)
        return dtoResult.toDomain()
    }
    
    
}

//
//  ServiceConstants.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

import Foundation

public enum APIPath {
    case Trending
    case Popular
    case Now
    case Soon
    case Detail(movieId: Int)
    
    func fullPath() -> String {
        var path: String = ""
        switch self {
        case .Trending:
            path = "trending/movie/day"
        case .Popular:
            path = "movie/popular"
        case .Now:
            path = "movie/now_playing"
        case .Soon:
            path = "movie/upcoming"
        case .Detail(let movieId):
            path = "movie/\(movieId)"
        }
        
        return Enviroment.baseUrl + path
    }
}

public extension APIPath {
    /// params: ["language": "en-US", "page": "2", ...]
    func fullPathUrl(params: [String: String?] = [:]) -> URL? {
        var components = URLComponents(string: self.fullPath())
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "api_key", value: Enviroment.apiKey)
        ]
        // Add other params (without nil or empty)
        for (key, value) in params {
            if let value = value, !value.isEmpty {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
        }
        components?.queryItems = queryItems
        return components?.url
    }
    
    func createURLRequest(
        httpMethod: HttpMethod,
        params: [String: String?] = [:]
    ) -> URLRequest? {
        guard let url = self.fullPathUrl(params: params) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}


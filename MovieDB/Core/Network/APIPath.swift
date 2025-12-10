//
//  ServiceConstants.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

import Foundation

public enum APIPath: String {
    case Trending = "trending/movie/day"
    case Popular = "movie/popular"
}

public extension APIPath {
    /// params: ["language": "en-US", "page": "2", ...]
    func fullPathUrl(params: [String: String?] = [:]) -> URL? {
        var components = URLComponents(string: Enviroment.baseUrl + self.rawValue)
        
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
        Logger.log("\(urlRequest.url?.absoluteString ?? "Can't create url")", logType: .Info)
        return urlRequest
    }
}


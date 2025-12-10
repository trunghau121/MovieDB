//
//  APIClient.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    init(
        urlSession: URLSession = .shared,
        jsonDecoder: JSONDecoder = JSONDecoder(),
        jsonEncoder: JSONEncoder = JSONEncoder()
    ) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }
    
    // Request with body
    func request<T: Decodable, Body: Encodable>(
        _ path: APIPath,
        method: HttpMethod = .GET,
        query: [String: String?] = [:],
        body: Body? = nil
    ) async throws -> T {
        guard var request = path.createURLRequest(httpMethod: method, params: query) else {
            throw APIError.invalidURL
        }
        
        Logger.log("\(request.debugDescription())", logType: .Info)
        if let body = body {
            request.httpBody = try jsonEncoder.encode(body)
            if request.value(forHTTPHeaderField: "Content-Type") == nil {
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        
        do {
            let (data, response) = try await urlSession.data(for: request)
            Logger.log("\(request.url?.absoluteString ?? "")", logType: .Info)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                Logger.log("HTTP Error: \(httpResponse.statusCode) - \(String(data: data, encoding: .utf8) ?? "")", logType: .Error)
                throw APIError.httpStatusCode(httpResponse.statusCode, data)
            }
            
            do {
                Logger.log("\(data.json)")
                return try jsonDecoder.decode(T.self, from: data)
            } catch {
                throw APIError.decodingError(error)
            }
        } catch let error as APIError {
            Logger.log("Error: \(error.localizedDescription)", logType: .Error)
            throw error
        } catch {
            Logger.log("Error: \(error.localizedDescription)", logType: .Error)
            throw APIError.unknown(error)
        }
    }
    
    // Overload Request with no body
    func request<T: Decodable>(
        _ path: APIPath,
        query: [String: String?] = [:]
    ) async throws -> T {
        try await request(path, method: .GET, query: query, body: Optional<String>.none as String?)
    }
}

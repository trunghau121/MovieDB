//
//  ErrorAPI.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case httpStatusCode(Int, Data?)
    case decodingError(Error)
    case unknown(Error)
}

//
//  URLRequestExtension.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

import Foundation

extension URLRequest {
    func debugDescription() -> String {
        var lines: [String] = []
        lines.append("--------------- REQUEST ---------------")
        lines.append("URL: \(self.url?.absoluteString ?? "nil")")
        lines.append("Method: \(self.httpMethod ?? "nil")")
        // Headers
        if let headers = self.allHTTPHeaderFields, !headers.isEmpty {
            lines.append("Headers:")
            for (key, value) in headers {
                lines.append("  \(key): \(value)")
            }
        } else {
            lines.append("Headers: none")
        }
        // Body
        if let body = self.httpBody,
           let jsonString = String(data: body, encoding: .utf8) {
            lines.append("Body:")
            lines.append(jsonString)
        } else {
            lines.append("Body: none")
        }
        lines.append("------------------------------------------")
        return lines.joined(separator: "\n")
    }
}

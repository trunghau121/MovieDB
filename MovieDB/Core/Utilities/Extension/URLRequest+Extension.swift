//
//  URLRequestExtension.swift
//  MovieDB
//
//  Created by 60156720 on 12/9/25.
//

import Foundation

public extension URLRequest {
    mutating func postMethod() {
        self.httpMethod = HttpMethod.POST.rawValue
    }
    
    mutating func getMethod() {
        self.httpMethod = HttpMethod.GET.rawValue
    }
        
    mutating func addHeaderApp() {
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}

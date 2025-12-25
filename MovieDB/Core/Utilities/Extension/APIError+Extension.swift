//
//  Error+Extension.swift
//  MovieDB
//
//  Created by 60156720 on 12/25/25.
//

extension Error {
    func getErrorMessage() -> String {
        if let error = self as? APIError {
            switch error {
            case APIError.unknown(let err):
                return err.localizedDescription
            case APIError.decodingError(let err):
                return err.localizedDescription
            case APIError.httpStatusCode(_, let content):
                return content?.json ?? "Error from Server. Please check again!"
            case APIError.invalidResponse:
                return AppText.invalidResponse.localized()
            case APIError.invalidURL:
                return AppText.invalidURL.localized()
            }
        }
        
        return self.localizedDescription
    }
}

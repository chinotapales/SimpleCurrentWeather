//
//  NetworkError.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

struct NetworkError: Codable, Error {
    var name: String?
    var code: Int?
    var error: String?
}

extension NetworkError {
    func errorMessage() -> String {
        guard let message = error else { return NetworkError.getErrorMessage(with: code ?? 999) }
        return message
    }
    
    static func getErrorMessage(with statusCode: Int) -> String {
        let errorResponse = NetworkErrorResponse(rawValue: statusCode) ?? .unknownError
        return errorResponse.message
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        return errorMessage()
    }
}

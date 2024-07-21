//
//  NetworkHeader.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

enum NetworkHeader {
    
    case accept
    case contentType
    case authorization
    
    var key: String {
        switch self {
        case .accept:
            return "Accept"
        case .contentType:
            return "Content-Type"
        case .authorization:
            return  "Authorization"
        }
    }
    
    var value: String {
        switch self {
        case .accept:
            return "*/*"
        case .contentType:
            return "application/json"
        default:
            return ""
        }
    }
    
    func toURLQueryItem() -> URLQueryItem {
        return URLQueryItem(name: key, value: value)
    }
}


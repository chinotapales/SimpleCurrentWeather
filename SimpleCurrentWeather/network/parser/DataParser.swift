//
//  DataParser.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

struct DataParser {
    
    private var jsonDecoder: JSONDecoder
    
    init() {
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .useDefaultKeys
    }
    
    func parse<T: Codable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
    
    func parseArray<T: Codable>(data: Data) throws -> [T] {
        return try jsonDecoder.decode([T].self, from: data)
    }
    
}

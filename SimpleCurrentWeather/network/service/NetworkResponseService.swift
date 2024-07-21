//
//  NetworkResponseService.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation
import Alamofire

struct NetworkResponseService {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    @discardableResult
    func performRequest(from route: NetworkRoute, completion: @escaping(Swift.Result<Void, Error>) -> Void) -> DataRequest {
        return networkService.performRequest(route: route) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    @discardableResult
    func performRequest<T: Codable>(from route: NetworkRoute, completion: @escaping(Swift.Result<T, Error>) -> Void) -> DataRequest {
        return networkService.performRequest(route: route) { result in
            switch result {
            case .success(let data):
                do {
                    let parsedData: T = try networkService.dataParser.parse(data: data)
                    completion(.success(parsedData))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    @discardableResult
    func performRequest<T: Codable>(from route: NetworkRoute, completion: @escaping(Swift.Result<[T], Error>) -> Void) -> DataRequest {
        return networkService.performRequest(route: route) { result in
            switch result {
            case .success(let data):
                do {
                    let parsedArray: [T] = try networkService.dataParser.parseArray(data: data)
                    completion(.success(parsedArray))
                }
                catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

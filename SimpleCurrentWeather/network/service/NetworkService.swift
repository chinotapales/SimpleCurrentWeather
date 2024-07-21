//
//  NetworkService.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation
import Alamofire

typealias DataResult = Swift.Result<Data, Error>

struct NetworkService {
    
    var session: Session!
    var dataParser: DataParser!
    
    private let emptyResponseStatusCodes: Set = [200, 204]
    private let timeOutDuration: TimeInterval = 60
    
    init() {
        session = getSession()
        dataParser = DataParser()
    }
    
    func getSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeOutDuration
        configuration.timeoutIntervalForResource = timeOutDuration
        configuration.waitsForConnectivity = true
        configuration.allowsCellularAccess = true
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        return configuration
    }
    
    func getSession() -> Session {
        let sessionConfiguration = getSessionConfiguration()
        let networkLogger = NetworkLogger()
        let session = Session(configuration: sessionConfiguration, startRequestsImmediately: true, eventMonitors: [networkLogger])
        return session
    }
    
    @discardableResult
    func performRequest(route: NetworkRoute, completion: @escaping ((DataResult) -> Void)) -> DataRequest {
        return session.request(route).responseData(emptyResponseCodes: emptyResponseStatusCodes) { response in
            switch response.result {
            case .success(let data):
                guard let httpResponse = response.response else {
                    let unknownError = NetworkError(name: "Error", code: 997, error: NetworkError.getErrorMessage(with: 997))
                    completion(.failure(unknownError))
                    return
                }
                let result = handleApiErrors(with: httpResponse.statusCode, and: data)
                completion(result)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func handleApiErrors(with statusCode: Int, and data: Data) -> DataResult {
        guard (200...308).contains(statusCode) else {
            do {
                let apiError: NetworkError = try dataParser.parse(data: data)
                return .failure(apiError)
            } catch let error {
                guard error is NetworkError else {
                    let networkError = NetworkError(name: "Error", code: statusCode, error: NetworkError.getErrorMessage(with: statusCode))
                    return .failure(networkError)
                }
                return .failure(error)
            }
        }
        return .success(data)
    }
    
}


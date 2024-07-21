//
//  DataRepository.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation
import Alamofire
 
class DataRepository {
    
    static let shared = DataRepository()
    
    let networkResponseService: NetworkResponseService
    
    init() {
        self.networkResponseService = NetworkResponseService(networkService: NetworkService())
    }
    
    func getCities(query: String, completion: @escaping (Swift.Result<[City], Error>) -> Void) {
        networkResponseService.performRequest(from: .getCities(query: query), completion: completion)
    }
    
    func getForecast(param: ForecastParam, completion: @escaping (Swift.Result<WeatherResponse, Error>) -> Void) {
        networkResponseService.performRequest(from: .getForecast(param: param), completion: completion)
    }
    
}

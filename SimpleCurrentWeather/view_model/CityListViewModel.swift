//
//  CityListViewModel.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 21/07/2024.
//

import Observation

@Observable
class CityListViewModel {
    
    var currentState: ViewState = .start
    
    var cities: [City] = []
    var searchQuery: String = ""
    
    func getCities() {
        self.currentState = .loading
        DataRepository.shared.getCities(query: searchQuery) { result in
            switch result {
            case .success(let cities):
                self.cities = cities
                self.currentState = .success
            case .failure(let error):
                self.currentState = .error(errorMessage: error.localizedDescription)
            }
        }
    }
}


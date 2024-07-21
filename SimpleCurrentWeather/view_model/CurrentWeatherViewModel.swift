//
//  CurrentWeatherViewModel.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Observation

@Observable
class CurrentWeatherViewModel {
    
    var currentState: ViewState = .start
    
    // Display Values
    var temperature: String = ""
    var apparentTemperature: String = ""
    var windSpeed: String = ""
    var windGusts: String = ""
    var windDirection: String = ""
    var rain: String = ""
    var cloudCover: String = ""
    
    func getWeatherResponse(latitude: String, longitude: String) {
        let currentTypes: [CurrentWeatherType] = [.temperature, .apparentTemperature, .rain, .cloudCover, .windSpeed, .windDirection, .windGusts]
        let param = ForecastParam(latitude: latitude, longitude: longitude, currentTypes: currentTypes, windSpeedUnit: "mph", timeFormat: "unixtime", forecastDays: 1)
        
        self.currentState = .loading
        DataRepository.shared.getForecast(param: param) { result in
            switch result {
            case .success(let weatherResponse):
                self.getDisplayData(from: weatherResponse)
                self.currentState = .success
            case .failure(let error):
                self.currentState = .error(errorMessage: error.localizedDescription)
            }
        }
    }
    
    //Convert Model to Display Data
    func getDisplayData(from weatherResponse: WeatherResponse) {
        let currentWeather = weatherResponse.currentWeather
        let currentUnits = weatherResponse.currentUnits
        
        temperature = "\(currentWeather.temperature)\(currentUnits.temperature)"
        apparentTemperature = "\(currentWeather.apparentTemperature)\(currentUnits.apparentTemperature)"
        windSpeed = "\(currentWeather.windSpeed)\(currentUnits.windSpeed)"
        windGusts = "\(currentWeather.windGusts)\(currentUnits.windGusts)"
        windDirection = convertWindDirection(with: currentWeather.windDirection)
        rain = "\(currentWeather.rain)\(currentUnits.rain)"
        cloudCover = "\(currentWeather.cloudCover)\(currentUnits.cloudCover)"
    }
    
    func convertWindDirection(with windDirection: Int) -> String {
        let directionArray = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        let index = Int((Double(windDirection) + 11.5).truncatingRemainder(dividingBy: 360) / 22.5)
        
        return directionArray[index]
    }
}

//
//  ForecastParam.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

// latitude=54.607868
// longitude=-5.926437
// current=temperature_2m,apparent_temperature,rain,cloud_cover,wind_speed_10m,wind_direction_10m,wind_gusts_10m
// wind_speed_unit=mph
// timeformat=unixtime
// forecast_days=1

class ForecastParam: Codable {
    var latitude: String = ""
    var longitude: String = ""
    var current: String = ""
    var windSpeedUnit: String = ""
    var timeFormat: String = ""
    var forecastDays: String = ""
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, current
        case windSpeedUnit = "wind_speed_unit"
        case timeFormat = "timeformat"
        case forecastDays = "forecast_days"
    }
    
    init(latitude: String, longitude: String, currentTypes: [CurrentWeatherType], windSpeedUnit: String, timeFormat: String, forecastDays: Int) {
        self.latitude = latitude
        self.longitude = longitude
        self.current = getCurrentString(from: currentTypes)
        self.windSpeedUnit = windSpeedUnit
        self.timeFormat = timeFormat
        self.forecastDays = String(forecastDays)
    }
    
    func getCurrentString(from currentTypes: [CurrentWeatherType]) -> String {
        let currentString = currentTypes.map { $0.rawValue }.joined(separator: ",")
        return currentString
        
    }
}

//
//  CurrentWeatherType.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

// temperature_2m
// apparent_temperature
// rain
// cloud_cover
// wind_speed_10m
// wind_direction_10m
// wind_gusts_10m

enum CurrentWeatherType: String {
    
    case temperature = "temperature_2m"
    case apparentTemperature = "apparent_temperature"
    case rain = "rain"
    case cloudCover = "cloud_cover"
    case windSpeed = "wind_speed_10m"
    case windDirection = "wind_direction_10m"
    case windGusts = "wind_gusts_10m"
    
}

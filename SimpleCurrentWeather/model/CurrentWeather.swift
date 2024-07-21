//
//  CurrentWeather.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

// "time": 1721498400,
// "interval": 900,
// "temperature_2m": 14.5,
// "apparent_temperature": 11.7,
// "rain": 0.00,
// "cloud_cover": 100,
// "wind_speed_10m": 9.3,
// "wind_direction_10m": 318,
// "wind_gusts_10m": 25.9

struct CurrentWeather: Codable {
    var time: Int = 0
    var interval: Int = 0
    var temperature: Double = 0.0
    var apparentTemperature: Double = 0.0
    var rain: Double = 0.0
    var cloudCover: Int = 0
    var windSpeed: Double = 0.0
    var windDirection: Int = 0
    var windGusts: Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case time, interval, rain
        case temperature = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case cloudCover = "cloud_cover"
        case windSpeed = "wind_speed_10m"
        case windDirection = "wind_direction_10m"
        case windGusts = "wind_gusts_10m"
    }
}

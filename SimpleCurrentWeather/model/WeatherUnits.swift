//
//  WeatherUnits.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

// "time": "unixtime",
// "interval": "seconds",
// "temperature_2m": "°C",
// "apparent_temperature": "°C",
// "rain": "mm",
// "cloud_cover": "%",
// "wind_speed_10m": "mp/h",
// "wind_direction_10m": "°",
// "wind_gusts_10m": "mp/h"

struct WeatherUnits: Codable {
    var time: String = ""
    var interval: String = ""
    var temperature: String = ""
    var apparentTemperature: String = ""
    var rain: String = ""
    var cloudCover: String = ""
    var windSpeed: String = ""
    var windDirection: String = ""
    var windGusts: String = ""
    
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

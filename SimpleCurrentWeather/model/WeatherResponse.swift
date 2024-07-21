//
//  WeatherResponse.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import Foundation

// {
//    "latitude": 54.61,
//    "longitude": -5.9300003,
//    "generationtime_ms": 0.5049705505371094,
//    "utc_offset_seconds": 0,
//    "timezone": "GMT",
//    "timezone_abbreviation": "GMT",
//    "elevation": 6.0,
//    "current_units": {
//        "time": "unixtime",
//        "interval": "seconds",
//        "temperature_2m": "°C",
//        "apparent_temperature": "°C",
//        "rain": "mm",
//        "cloud_cover": "%",
//        "wind_speed_10m": "mp/h",
//        "wind_direction_10m": "°",
//        "wind_gusts_10m": "mp/h"
//    },
//    "current": {
//        "time": 1721498400,
//        "interval": 900,
//        "temperature_2m": 14.5,
//        "apparent_temperature": 11.7,
//        "rain": 0.00,
//        "cloud_cover": 100,
//        "wind_speed_10m": 9.3,
//        "wind_direction_10m": 318,
//        "wind_gusts_10m": 25.9
//    }
// }

struct WeatherResponse: Codable {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var currentUnits: WeatherUnits = WeatherUnits()
    var currentWeather: CurrentWeather = CurrentWeather()
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case currentUnits = "current_units"
        case currentWeather = "current"
    }
}


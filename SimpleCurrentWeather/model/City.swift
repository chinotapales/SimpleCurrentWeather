//
//  City.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 21/07/2024.
//

import Foundation

// "place_id": 244222156,
// "licence": "Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright",
// "osm_type": "way",
// "osm_id": 1219767831,
// "boundingbox": [
//     "54.5306104",
//     "54.6594247",
//     "-6.0454798",
//     "-5.8076879"
// ],
// "lat": "54.596391",
// "lon": "-5.9301829",
// "display_name": "Belfast, County Antrim, Northern Ireland, United Kingdom",
// "class": "place",
// "type": "city",
// "importance": 0.7600238353643837

struct City: Codable {
    var placeId: Int = 0
    var latitude: String = ""
    var longitude: String = ""
    var displayName: String = ""
    
    enum CodingKeys: String, CodingKey {
        case placeId = "place_id"
        case latitude = "lat"
        case longitude = "lon"
        case displayName = "display_name"
    }
}

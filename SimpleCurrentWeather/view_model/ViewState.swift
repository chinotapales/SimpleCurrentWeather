//
//  ViewState.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 21/07/2024.
//

import Foundation

enum ViewState: Equatable {
    case start
    case loading
    case error(errorMessage: String)
    case success
}

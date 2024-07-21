//
//  CurrentWeatherView.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 20/07/2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @State private var viewModel: CurrentWeatherViewModel = CurrentWeatherViewModel()
    
    var city: City
    
    init(city: City) {
        self.city = city
    }
    
    var body: some View {
        VStack {
            switch viewModel.currentState {
            case .start:
                ContentUnavailableView {
                    Label("No Weather Info Available", systemImage: "sun.min")
                }
            case .loading:
                ProgressView()
            case .error(let errorMessage):
                ContentUnavailableView {
                    Label("Error", systemImage: "exclamationmark.triangle.fill")
                } description: {
                    Text(errorMessage)
                }
            case .success:
                VStack(alignment: .leading, spacing: 16.0) {
                    Text(city.displayName)
                        .font(.system(size: 32.0))
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    HStack(spacing: 8.0) {
                        Label("Temperature", systemImage: "thermometer")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.temperature)
                            .font(.system(size:18.0))
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8.0) {
                        Label("Feels Like", systemImage: "thermometer.variable.and.figure")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.apparentTemperature)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8.0) {
                        Label("Wind Speed", systemImage: "wind")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.windSpeed)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8.0) {
                        Label("Wind Gust", systemImage: "wind")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.windGusts)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8.0) {
                        Label("Wind Direction", systemImage: "safari")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.windDirection)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8.0) {
                        Label("Rain", systemImage: "cloud.rain")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.rain)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                    }
                    HStack(spacing: 8.0) {
                        Label("Cloud Cover", systemImage: "cloud")
                            .font(.system(size: 19.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Text(viewModel.cloudCover)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.getWeatherResponse(latitude: city.latitude, longitude: city.longitude)
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let city = City(
            placeId: 244222156,
            latitude: "54.596391",
            longitude: "-5.9301829",
            displayName: "Belfast, County Antrim, Northern Ireland, United Kingdom")
        CurrentWeatherView(city: city)
    }
}

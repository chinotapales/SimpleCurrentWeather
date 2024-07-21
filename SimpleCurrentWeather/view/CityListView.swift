//
//  CityListView.swift
//  SimpleCurrentWeather
//
//  Created by Carlo Gabriel Villalon Tapales on 21/07/2024.
//

import SwiftUI

struct CityListView: View {
    
    @State private var viewModel: CityListViewModel = CityListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cities, id: \.placeId) { city in
                    NavigationLink {
                        CurrentWeatherView(city: city)
                    } label: {
                        Label(city.displayName, systemImage: "building.2")
                            .font(.system(size: 15.0))
                            .fontWeight(.medium)
                    }
                }
            }
            .navigationTitle("Cities")
            .searchable(text: $viewModel.searchQuery)
            .onSubmit(of: .search) {
                viewModel.getCities()
            }
            .overlay {
                switch viewModel.currentState {
                case .start:
                    ContentUnavailableView {
                        Label("No Cities Available", systemImage: "building.2.crop.circle")
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
                    if viewModel.cities.isEmpty {
                        ContentUnavailableView {
                            Label("No Cities Available", systemImage: "building.2.crop.circle")
                        }
                    }
                }
            }
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}

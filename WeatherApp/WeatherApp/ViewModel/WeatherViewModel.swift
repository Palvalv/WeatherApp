//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Pablo Álvarez Álvarez on 23/11/23.
//

/**
 Encargado de las peticiones HTTP
 */

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel = .empty
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71c3e78149e90edcb26b5c8bf57708fa")
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url!)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

//
//  WeatherModelMapper.swift
//  WeatherApp
//
//  Created by Pablo Álvarez Álvarez on 23/11/23.
//

import Foundation

struct WeatherModelMapper {
    func mapDataModelToModel(dataModel: WeatherResponseDataModel) -> WeatherModel {
        guard let weather = dataModel.weather.first else {
            return .empty
        }
        
        let temperature = dataModel.temperature
        
        return WeatherModel(city: dataModel.city,
                            weather: weather.main,
                            description: "(\(weather.description))",
                            iconURL: URL(string:"http://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"), currentTemperature: "\(Int(temperature.currentTemperature))º", minTemperature: "\(Int(temperature.minTemperature))º Min.", maxTemperature: "\(Int(temperature.maxTemperature))º Max.", humidity: "\(temperature.humidity)%" )
    }
}

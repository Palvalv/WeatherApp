//
//  WeatherResponseDataModel.swift
//  WeatherApp
//
//  Created by Pablo Álvarez Álvarez on 23/11/23.
//

import Foundation

struct WeatherResponseDataModel: Decodable {
    let city: String
    let weather: [WeatherDataModel]
    let temperature: TemperatureDataModel
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case temperature = "main"
    }
    
    struct WeatherDataModel: Decodable {
        let main: String
        let description: String
        let iconURLString: String
        
        // El nombre de las propiedades del JSON son diferentes a nuestro nombre de variables por lo que hacemos un enum CodingKeys para mapear
        enum CodingKeys: String, CodingKey {
            case main
            case description
            case iconURLString = "icon"
            
        }
    }
    
    struct TemperatureDataModel: Decodable {
        let currentTemperature: Double
        let minTemperature: Double
        let maxTemperature: Double
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case currentTemperature = "temp"
            case minTemperature = "temp_min"
            case maxTemperature = "temp_max"
            case humidity
            
        }
    }
    
    /*
     {
     "coord": {
     "lon": -5.9761,
     "lat": 37.3824
     },
     "weather": [
     {
     "id": 800,
     "main": "Clear",
     "description": "clear sky",
     "icon": "01d"
     }
     ],
     "base": "stations",
     "main": {
     "temp": 291.8,
     "feels_like": 290.9,
     "temp_min": 290.97,
     "temp_max": 293.1,
     "pressure": 1021,
     "humidity": 45
     },
     "visibility": 10000,
     "wind": {
     "speed": 3.6,
     "deg": 40
     },
     "clouds": {
     "all": 0
     },
     "dt": 1700745400,
     "sys": {
     "type": 2,
     "id": 2011488,
     "country": "ES",
     "sunrise": 1700723480,
     "sunset": 1700759365
     },
     "timezone": 3600,
     "id": 2510911,
     "name": "Seville",
     "cod": 200
     }
     */
}

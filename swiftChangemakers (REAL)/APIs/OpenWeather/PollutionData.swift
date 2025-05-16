//
//  PollutionData.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import Foundation

// Respuesta del clima
struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
}

struct Weather: Decodable {
    let description: String
}

struct Main: Decodable {
    let temp: Double
}

// Respuesta de contaminación
struct PollutionResponse: Decodable {
    let list: [PollutionData]
}

struct PollutionData: Decodable {
    let main: AirQuality
}

struct AirQuality: Decodable {
    let aqi: Int  // Índice de calidad del aire (1=Bueno, 5=Muy malo)
}

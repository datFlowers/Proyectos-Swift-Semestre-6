//
//  NewsViewModel.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI
import Combine

// Aqui la mayoria maneja lo mismo que ArticleNews, aunque ArticleNews tiene structs para cosas
// NewsViewModel maneja ambos aspectos, de clima y los articulos

class NewsViewModel: ObservableObject {
    @Published var articulos: [ArticuloNoticia] = []
    @Published var weather: WeatherResponse?
    @Published var pollution: PollutionResponse?
    
    private let apiKey = "fd344e3552018db1297c78e227d20814"
    private let monterreyLat = 25.6866
    private let monterreyLon = -100.3161
    private var cancellable: AnyCancellable?

    // Descarga información del clima actual en Monterrey usando el API de OpenWeatherMap
    func fetchWeather() {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Monterrey,mx&appid=\(apiKey)&lang=es"

        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    } catch {
                        print("Error decodificando el clima:", error)
                    }
                }
            }
        }.resume()
    }
    
    // Descarga información de la calidad del aire en Monterrey
    func fetchPollution() {
        let urlString = "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(monterreyLat)&lon=\(monterreyLon)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.pollution = try JSONDecoder().decode(PollutionResponse.self, from: data)
                    } catch {
                        print("Error decodificando la contaminación:", error)
                    }
                }
            }
        }.resume()
    }
    
    // Función para cargar ambas informaciones
    func fetchData() {
        fetchWeather()
        fetchPollution()
    }

    // Funcion para cargar noticias
    func fetchNoticias() {
        let query = "Monterrey Nuevo León OR Monterrey México" // Cargamos articulos de Nuevo Leon o Mexico en general
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://newsapi.org/v2/everything?q=\(encodedQuery)&language=es&sortBy=relevancy&apiKey=d8ce97eb4e7f467b84ce30895150db1e") else {
            print("Invalid URL")
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response in
                // Recibimos el response del HTTP
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("Error: \(httpResponse.statusCode)") // Debugging
                    return Data() // Regresa datos vacios por si no es existoso
                }
                return data // Si es exitoso, regresa los valores que recibimos
            }
            .decode(type: NewsAPIResponse.self, decoder: JSONDecoder())
            .replaceError(with: NewsAPIResponse(articles: []))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                if response.articles.isEmpty {
                    print("No articles found.")
                } else {
                    print("Loaded \(response.articles.count) articles.")
                }
                // Limitar a solo 10 articulos mas recientes
                self?.articulos = response.articles.prefix(10).map { $0 }
            }
    }
}

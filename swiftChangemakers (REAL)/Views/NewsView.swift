//
//  NewsView.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI
import UIKit

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Condición Climática")
                        .font(.title)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            if let weather = viewModel.weather {
                                let celsius = weather.main.temp - 273.15
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Clima en Monterrey \(emojiForWeather(description: weather.weather.first?.description ?? ""))")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("Temp: \(String(format: "%.1f", celsius))°C")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    if let description = weather.weather.first?.description.capitalized {
                                        Text("Condición: \(description)")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                    
                                    
                                }
                                .padding()
                                .frame(width: 250, height: 150)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.blue)
                                        .shadow(radius: 5)
                                )
                            } else {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 250, height: 150)
                                    .overlay(
                                        Text("Cargando clima...")
                                            .foregroundColor(.gray)
                                    )
                            }
                            
                            if let pollution = viewModel.pollution {
                                let aqiValue = pollution.list.first?.main.aqi ?? 0
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Calidad del aire")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("AQI: \(aqiValue)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(aqiDescription(for: aqiValue))
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 250, height: 150)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(colorForAQI(aqiValue))
                                        .shadow(radius: 5)
                                )
                            } else {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 250, height: 150)
                                    .overlay(
                                        Text("Cargando contaminación...")
                                            .foregroundColor(.gray)
                                    )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Artículos recientes")
                        .font(.title)
                        .padding(.horizontal)

                    if viewModel.articulos.isEmpty {
                        Text("Cargando artículos... \(viewModel.articulos.count) artículos cargados")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .onAppear {
                                viewModel.fetchNoticias()
                            }
                    } else {
                        ForEach(viewModel.articulos) { articulo in
                            VStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .frame(height: 150)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                    .overlay(
                                        VStack {
                                            Text(articulo.titulo)
                                                .font(.headline)
                                                .foregroundColor(.black).bold()
                                                .padding(.bottom, 5)
                                            Text(articulo.descripcion)
                                                .font(.subheadline)
                                                .foregroundColor(.black)
                                                .lineLimit(2)
                                                .padding(.bottom, 5)
                                        }
                                        .padding()
                                    )
                                    .onTapGesture {
                                        if let url = URL(string: articulo.url) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                }
            }
            .navigationTitle("News")
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
    
    private func aqiDescription(for value: Int) -> String {
        switch value {
        case 1:
            return "Buena"
        case 2:
            return "Moderada"
        case 3:
            return "Pobre"
        case 4:
            return "Muy pobre"
        case 5:
            return "Extremadamente pobre"
        default:
            return "Desconocida"
        }
    }
    
    private func colorForAQI(_ aqi: Int) -> Color {
        
        if aqi == 1 || aqi == 2 {
            return .green
        }
        if aqi == 3 || aqi == 4{
            return .orange
        }
        if aqi == 5{
            return .red
        }
        
        return .green
    }
    
    private func emojiForWeather(description: String) -> String {
        switch description.lowercased() {
        case "cielo claro":
            return "☀️" // Sol
        case "pocas nubes":
            return "🌤️" // Nubes dispersas
        case "nubes dispersas":
            return "⛅" // Nubes esparcidas
        case "nubes rotas":
            return "☁️" // Nubes rotas
        case "lluvia ligera":
            return "🌧️" // Lluvia ligera
        case "lluvia":
            return "🌦️" // Lluvia moderada
        case "tormenta":
            return "⛈️" // Tormenta
        case "nieve":
            return "❄️" // Nieve
        case "neblina":
            return "🌫️" // Neblina
        default:
            return "🌥️" // Clima desconocido
        }
    }
}

#Preview {
    NewsView()
}

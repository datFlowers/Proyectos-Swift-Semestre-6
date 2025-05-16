import SwiftUI
import Combine
import WeatherKit
import CoreLocation
import UIKit

// Modelo para representar un artículo de noticias
struct ArticuloNoticia: Identifiable, Decodable {
    let id = UUID()
    let titulo: String
    let descripcion: String
    let url: String

    private enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case descripcion = "description"
        case url = "url"
    }
}

// ViewModel para manejar la lógica de obtención y actualización de datos
class NoticiasViewModel: ObservableObject {
    @Published var articulos: [ArticuloNoticia] = []
    private var cancellable: AnyCancellable?
    private var timerCancellable: AnyCancellable?
    
    init() {
        fetchNoticias()
        configurarTemporizador()
    }

    func fetchNoticias() {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=localidad%20OR%20eventos&apiKey=d8ce97eb4e7f467b84ce30895150db1e") else {
            print("Invalid URL")
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response in
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("Error: \(httpResponse.statusCode)") // Debugging
                    return Data() // Return empty data if the response is not successful
                }
                return data
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
                self?.articulos = response.articles
            }
    }

    private func configurarTemporizador() {
        timerCancellable = Timer.publish(every: 86400, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.fetchNoticias()
            }
    }
}

struct NoticiasView: View {
    @StateObject private var viewModel = NoticiasViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Sección de Noticias
                    Text("Artículos recientes")
                        .font(.title)
                        .padding(.horizontal)

                    if viewModel.articulos.isEmpty {
                        Text("Cargando artículos... \(viewModel.articulos.count) artículos cargados")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .onAppear {
                                // Trigger data fetch here if it isn't started yet
                                viewModel.fetchNoticias()
                            }
                    } else {
                        ForEach(viewModel.articulos) { articulo in
                            VStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.blue)
                                    .frame(height: 150)
                                    .overlay(
                                        VStack {
                                            Text(articulo.titulo)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.bottom, 5)
                                            Text(articulo.descripcion)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
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
            .navigationTitle("Noticias de Clima y Contaminación")
        }
    }
}

struct NewsAPIResponse: Decodable {
    let articles: [ArticuloNoticia]
}

//
//  HomeView.swift
//  swiftChangemakers
//
//  Created by Alumno on 26/03/25.
//

import SwiftUI
import MapKit


struct HomeView: View {
    @StateObject private var locationManager = CustomLocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showFullMap = false
    @State private var initialRegionSet = false
    @State private var nearbyAnnotations: [AnnotationItem] = sampleAnnotations
    @State private var selectedAnnotation: AnnotationItem?
    @State private var isSheetPresented: Bool = false
    @State private var city: String = "Desconocida"
    @State private var tips: [String] = []

    // Descubre ciudades dependiendo de tu locación
    var discoverPlaces: [DiscoverPlace] {
        switch city {
        case "Monterrey":
            return monterreyPlaces
        case "Guadalajara":
            return guadalajaraPlaces
        default:
            return monterreyPlaces // O puedes retornar cualquier lista que prefieras
        }
    }

    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Buenos días ☀️"
        case 12..<20:
            return "Buenas tardes 🌇"
        default:
            return "Buenas noches 🌙"
        }
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: Date()).capitalized
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    // Greeting Section
                    Text(greeting)
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.leading, 30)
                    
                    // Map Section
                    ZStack(alignment: .topTrailing) {
                        Map(coordinateRegion: $region,
                            showsUserLocation: true,
                            annotationItems: nearbyAnnotations) { item in
                            MapAnnotation(coordinate: item.coordinate) {
                                VStack(spacing: 4) {
                                    Image(systemName: "mappin.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.title)
                                        .shadow(radius: 3)
                                    Text(item.name)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding(4)
                                        .background(Color.white.opacity(0.8))
                                        .cornerRadius(8)
                                }
                                .onTapGesture {
                                    openInAppleMaps(coordinate: item.coordinate, name: item.name)
                                }
                            }
                        }
                        .frame(height: 330)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .shadow(radius: 5)
                        .onAppear {
                            if let userLocation = locationManager.location?.coordinate, !initialRegionSet {
                                region = MKCoordinateRegion(
                                    center: userLocation,
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                )
                                initialRegionSet = true
                            }
                        }
                    }
                    
                    // Categories Section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(categories) { category in
                                VStack {
                                    Button(action: {
                                        if let userLocation = locationManager.location?.coordinate {
                                            showNearby(category: category.searchType, at: userLocation) { newAnnotations in
                                                nearbyAnnotations = newAnnotations
                                            }
                                        }
                                    }) {
                                        VStack {
                                            Image(systemName: category.icon)
                                                .font(.system(size: 30))
                                                .foregroundColor(.white)
                                                .padding().frame(width: 65, height: 65)
                                                .background(Circle().fill(Color.blue))
                                        }
                                    }
                                    Text(category.name)
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                    
                    // DESCUBRE Section (Carrusel con Parallax)
                    if !discoverPlaces.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Descubre")
                                .font(.title)
                                .bold()
                                .padding(.top).padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(discoverPlaces, id: \.id) { place in
                                        VStack(spacing: 0) {
                                            // Imagen con efecto parallax
                                            Image(place.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 300, height: 200)
                                                .clipped()
                                                .scrollTransition(axis: .horizontal) { content, phase in
                                                    content.offset(x: phase.value * -80)
                                                }
                                            
                                            // Texto debajo de la imagen
                                            Text(place.name)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .background(Color.white)
                                        }
                                        // Se define un ancho fijo para la tarjeta
                                        .frame(width: 300)
                                        // Se aplica un fondo y se recorta la vista completa con esquinas redondeadas
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                        .shadow(radius: 5)
                                        .onTapGesture {
                                            openInAppleMaps(coordinate: place.coordinate, name: place.name)
                                        }
                                    }
                                }
                                .padding()
                                .scrollTargetLayout()
                                .scrollTargetBehavior(.paging)
                            }

                        }
                    }
                    
                    // Tips Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Consejos para ti en \(city)")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        ForEach(tips, id: \.self) { tip in
                            TipCard(tip: tip)
                        }
                    }
                    .padding(.leading, -3)
                    .padding(.top)
                }
                .onReceive(locationManager.$location) { newLocation in
                    if let newLocation = newLocation, !initialRegionSet {
                        region = MKCoordinateRegion(
                            center: newLocation.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        )
                        initialRegionSet = true
                        fetchCityAndTips(from: newLocation)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Text("Hoy")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical, 30)
                        Text(formattedDate)
                            .font(.subheadline)
                            .foregroundColor(Color.primary.opacity(0.6))
                            .bold()
                            .padding(.vertical, 30)
                            .padding(.top, 5)
                    }
                }
            }
        }
    }
    
    private func fetchCityAndTips(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first, let cityName = placemark.locality {
                DispatchQueue.main.async {
                    self.city = cityName
                    self.tips = getTips(for: cityName)
                }
            }
        }
    }
    
    private func getTips(for city: String) -> [String] {
        switch city {
        case "Monterrey":
            return [
                "Utiliza cubrebocas si pasarás tiempo al aire libre.",
                "Prueba la gastronomía local en el Barrio Antiguo.",
                "Explora el Museo de Arte Contemporáneo (MARCO)."
            ]
        case "Guadalajara":
            return [
                "Disfruta de un espectáculo en el Teatro Degollado.",
                "Visita el Instituto Cultural Cabañas, patrimonio de la humanidad.",
                "Prueba la birria, un platillo típico de la región."
            ]
        default:
            return [
                "Explora los mercados locales para conocer la cultura de la ciudad.",
                "Infórmate sobre los eventos culturales que se realizan esta semana.",
                "Consulta las recomendaciones de seguridad locales antes de salir."
            ]
        }
    }
}

// Existing AnnotationItem and sampleAnnotations
struct AnnotationItem: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let sampleAnnotations: [AnnotationItem] = [
    // Example: AnnotationItem(name: "Parque Central", coordinate: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161))
]

// Existing Category model and categories list
struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let searchType: String
}

let categories: [Category] = [
    Category(name: "Hospitales", icon: "cross.case.fill", searchType: "hospital"),
    Category(name: "Transporte", icon: "bus.fill", searchType: "transport"),
    Category(name: "Bancos", icon: "building.columns.fill", searchType: "bank"),
    Category(name: "Gimnasios", icon: "figure.strengthtraining.traditional", searchType: "gym"),
    Category(name: "Hotel", icon: "building.fill", searchType: "hotel"),
    Category(name: "Parques", icon: "leaf.fill", searchType: "park"),
    Category(name: "Escuelas", icon: "book.fill", searchType: "school"),
    Category(name: "Policía", icon: "shield.lefthalf.filled", searchType: "police"),
    Category(name: "Bomberos", icon: "flame.fill", searchType: "fire")
]

// Your function to open Apple Maps 
func openInAppleMaps(coordinate: CLLocationCoordinate2D, name: String) {
    let placemark = MKPlacemark(coordinate: coordinate)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = name
    mapItem.openInMaps()
}

#Preview {
    HomeView()
}

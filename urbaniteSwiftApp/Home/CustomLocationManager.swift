//
//  LocationManager.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import Foundation
import CoreLocation

// Mapa principal que aparece en HomeView, usado para mostrar la area cercana del usuario base su ubicacion
class CustomLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var location: CLLocation? = nil
    @Published var city: String = "Desconocida"

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.location = location
                self.reverseGeocode(location: location)
            }
        }
    }
    
    private func reverseGeocode(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let placemark = placemarks?.first, let city = placemark.locality {
                DispatchQueue.main.async {
                    self?.city = city
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error al obtener la localización: \(error.localizedDescription)")
    }
}

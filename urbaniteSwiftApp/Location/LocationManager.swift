//
//  LocationManager.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import MapKit
import CoreLocation

// Clase para gestionar la ubicación del usuario
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.4168, longitude: -3.7038), // Valor por defecto (Madrid)
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()  // Solicita permisos
        manager.startUpdatingLocation()           // Inicia la actualización de la ubicación
    }
    
    // Se llama cuando se actualiza la ubicación del usuario
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(
                center: latestLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
}


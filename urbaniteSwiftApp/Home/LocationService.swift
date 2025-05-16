//
//  LocationService.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import Foundation
import CoreLocation

// Servicios de ubicacion que reconocemos dentro de CustomLocationManager
class LocationService {
    private let locationManager = CLLocationManager()

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }

    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }
}

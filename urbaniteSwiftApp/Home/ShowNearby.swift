//
//  ShowNearby.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import MapKit

func showNearby(category: String, at coordinate: CLLocationCoordinate2D, completion: @escaping ([AnnotationItem]) -> Void) {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = category
    // Usa una región centrada en la ubicación actual del usuario, con un span adecuado
    request.region = MKCoordinateRegion(
        center: coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    let search = MKLocalSearch(request: request)
    search.start { response, error in
        guard let response = response else {
            print("Error en la búsqueda: \(error?.localizedDescription ?? "Desconocido")")
            completion([])
            return
        }
        // Mapea los resultados a AnnotationItem para mostrarlos en el mapa
        let annotations = response.mapItems.map { item in
            AnnotationItem(name: item.name ?? category, coordinate: item.placemark.coordinate)
        }
        completion(annotations)
    }
}

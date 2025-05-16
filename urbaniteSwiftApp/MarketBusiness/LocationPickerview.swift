//
//  LocationPickerview.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI
import MapKit

// Ubicacion exacto del negocio cuando carga en el mapa
struct LocationPickerView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var coordinate: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion

    // Recibe las coordenadas para poder poner el pin de la ubicacion
    init(coordinate: Binding<CLLocationCoordinate2D>) {
        self._coordinate = coordinate
        self._region = State(initialValue: MKCoordinateRegion(
            center: coordinate.wrappedValue,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }

    // Aqui cargamos el marcador en el mapa de la ubicacion
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: [AnnotatedLocation(coordinate: coordinate)]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .ignoresSafeArea()
        .onTapGesture {
            // Actualiza la coordenada al centro actual del mapa
            coordinate = region.center
            dismiss()
        }
        .navigationTitle("Selecciona ubicación")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnnotatedLocation: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
}

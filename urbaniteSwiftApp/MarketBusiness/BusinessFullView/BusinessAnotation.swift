//
//  BusinessAnotation.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI
import MapKit

struct BusinessAnnotation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

// Ubicacion para los diferentes negocios dentro del MarketView
struct BusinessLocationMapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        _region = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [BusinessAnnotation(name: "Ubicación", coordinate: coordinate)]) { item in
            MapAnnotation(coordinate: item.coordinate) {
                Image(systemName: "mappin.circle.fill")
                    .font(.title)
                    .foregroundColor(.red)
                    .shadow(radius: 3).onTapGesture {
                        openInAppleMaps(coordinate: item.coordinate, name: item.name)}
            }
        }
        .frame(height: 200)
        .cornerRadius(15)
        .padding(.horizontal)
    }
}


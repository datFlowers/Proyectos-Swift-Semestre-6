//
//  PlaceDetailView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import MapKit
import Contacts


struct PlaceDetailView: View {
    var mapItem: MKMapItem

    var body: some View {
        VStack {
            Text(mapItem.name ?? "Sin nombre")
                .font(.largeTitle)
                .padding()

            if let phoneNumber = mapItem.phoneNumber {
                Text("Teléfono: \(phoneNumber)")
            }

            if let url = mapItem.url {
                Link("Sitio web", destination: url)
            }

            if let address = mapItem.placemark.postalAddress {
                Text("Dirección: \(CNPostalAddressFormatter.string(from: address, style: .mailingAddress))")
            }

            // Agrega más información según sea necesario

            Button("Cerrar") {
                // Código para cerrar la hoja
            }
        }
        .padding()
    }
}

#Preview{
    PlaceDetailView(mapItem: MKMapItem())
}

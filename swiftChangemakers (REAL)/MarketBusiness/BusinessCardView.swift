//
//  BusinessCardView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import CoreLocation

enum MarketSection: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case todos = "Todos"
    case restaurantes = "Restaurantes"
    case cafeterias = "Cafeterias"
    case personal = "Personal"
    case belleza = "Belleza"
    case ropa = "Ropa"
    case creativos = "Creativos"
    case reparaciones = "Reparaciones"
    case limpieza = "Limpieza"
    case huertos = "Huertos"
}

struct BusinessCardView: View {
    var id: Int
    var backgroundImage: Image
    var logoImage: Image
    var name: String
    var description: String
    var contact: String
    var section: MarketSection
    var coordinate: CLLocationCoordinate2D
    
    // Nueva propiedad para identificar si es sponsor
    var isSponsor: Bool = false

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            // Gradiente para mejorar la legibilidad
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                           startPoint: .bottom,
                           endPoint: .center)
                .frame(height: 200)
            
            VStack(alignment: .leading, spacing: 8) {
                logoImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 4)
                
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(contact)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
            
            // Si es sponsor, se añade un badge 
            if isSponsor {
                HStack {
                    Spacer()
                    VStack {
                        Text("Sponsor")
                            .font(.caption2)
                            .bold()
                            .foregroundColor(.yellow)
                            .padding(6)
                            .background(Color.black.opacity(0.9))
                            .clipShape(Capsule())
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


// Datos de ejemplo
var sampleMarketThreads: [BusinessCardView] = [
    BusinessCardView(
            id: 1,
            backgroundImage: Image("Bazares"),
            logoImage: Image("Bazar Ropa Logo"),
            name: "Bazar del Mercado",
            description: "Ven y descubre lo mejor de la ciudad",
            contact: "Tel: 555-1234",
            section: .ropa,
            coordinate: CLLocationCoordinate2D(latitude: 25.6870, longitude: -100.3165),
            isSponsor: false // Este negocio es sponsor
        ),
        BusinessCardView(
            id: 2,
            backgroundImage: Image("Coffee Shop"),
            logoImage: Image("Coffee Shop Logo"),
            name: "Cafetería Local",
            description: "Despiértate con nuestro exquisito espresso",
            contact: "Tel: 555-1234",
            section: .cafeterias,
            coordinate: CLLocationCoordinate2D(latitude: 25.6868, longitude: -100.3170),
            isSponsor: true
        ),
    
    BusinessCardView(
        id: 3,
        backgroundImage: Image("Local Restaurant"),
        logoImage: Image("Mr Kebabs"),
        name: "Restaurante Kebabs",
        description: "Comida tradicional con un toque moderno.",
        contact: "Tel: 555-1234",
        section: .restaurantes,
        coordinate: CLLocationCoordinate2D(latitude: 25.6875, longitude: -100.3155), isSponsor: false
    ),
    
    BusinessCardView(
        id: 4,
        backgroundImage: Image("Cleaning Service"),
        logoImage: Image("cleaningLogo"),
        name: "Limpieza",
        description: "En menos de 5 horas tu casa estará limpia.",
        contact: "Tel: 555-1234",
        section: .limpieza,
        coordinate: CLLocationCoordinate2D(latitude: 25.6860, longitude: -100.3160), isSponsor: true
    )
]


/*
struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView(
            backgroundImage: Image("businessBackground"), // Asegúrate de tener esta imagen en Assets
            logoImage: Image("businessLogo"),             // Asegúrate de tener esta imagen en Assets
            name: "Nombre del Negocio",
            description: "Breve descripción del negocio.",
            contact: "Contacto: 123-456-7890"
        )
    }
}
*/

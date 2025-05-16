//
//  BusinessDetailView.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct BusinessDetailView: View {
    var business: Business
    var coverImage: Image
    var logoImage: Image

    // Reseñas de ejemplo
    @State private var reviews: [Review] = [
        Review(id: UUID(), username: "Alice", rating: 5, text: "¡Excelente servicio!"),
        Review(id: UUID(), username: "Bob", rating: 4, text: "Muy bueno, pero puede mejorar.")
    ]
    
    // Estados para agregar una nueva review
    @State private var newReviewText: String = ""
    @State private var newReviewRating: Int = 5

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header con la imagen de portada y el logo integrado
                BusinessHeaderView(coverImage: coverImage, logoImage: logoImage)
                    .frame(height: 250)
                
                // Información del negocio
                VStack(alignment: .leading, spacing: 8) {
                    Text(business.name)
                        .font(.largeTitle)
                        .fontWeight(.bold).padding(.top, 20)
                    
                    Text(business.description)
                        .font(.body)
                    
                    HStack {
                        Image(systemName: "phone.fill")
                        Text(business.contact)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // Mapa que muestra la ubicación del negocio
                Text("Ubicación")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                BusinessLocationMapView(coordinate: business.coordinate)
                
                Divider()
                
                // Sección de Reviews
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reviews")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // Lista de reviews
                    ForEach(reviews) { review in
                        ReviewRow(review: review)
                    }
                    
                    // Formulario para agregar una nueva review
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Deja tu review")
                            .font(.headline)
                        
                        HStack {
                            RatingView(rating: $newReviewRating)
                            Text("\(newReviewRating) / 5")
                                .foregroundColor(.secondary)
                        }
                        
                        TextField("Escribe tu review...", text: $newReviewText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            // Agregar la nueva review y resetear estados
                            let review = Review(id: UUID(), username: "Tú", rating: newReviewRating, text: newReviewText)
                            reviews.append(review)
                            newReviewText = ""
                            newReviewRating = 5
                        }) {
                            Text("Enviar Review")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(business.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

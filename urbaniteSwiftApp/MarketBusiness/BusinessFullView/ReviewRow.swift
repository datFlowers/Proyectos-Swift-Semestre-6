//
//  ReviewRow.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI

// Vista para cada review individual
struct ReviewRow: View {
    var review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(review.username)
                    .fontWeight(.bold)
                Spacer()
                HStack(spacing: 2) {
                    // Checa el numero de estrellas seleccionadas originalmente
                    ForEach(0..<5) { index in
                        Image(systemName: index < review.rating ? "star.fill" : "star")
                            .foregroundColor(index < review.rating ? .yellow : .gray)
                    }
                }
                .font(.caption)
            }
            Text(review.text)
                .font(.body)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
    }
}
